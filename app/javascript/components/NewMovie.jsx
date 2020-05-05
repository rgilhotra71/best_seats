import React from "react";
import { Link } from "react-router-dom";

class NewMovie extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      summary: "",
      genre: "",
      year: "",
      rows: "",
      columns: "",
      imdb_link: ""
    };

    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  onChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  onSubmit(event) {
    event.preventDefault();
    const url = "/api/v1/movies";
    const { title, summary, genre, year, rows, columns, imdb_link } = this.state;

    if (title.length == 0 || summary.length == 0 || genre.length == 0 || year.length == 0 || rows.length == 0 || columns.length == 0)
      return;

    const body = {
      title,
      summary: summary.replace(/\n/g, "<br> <br>"),
      genre,
      year,
      rows,
      columns
    };

    const token = document.querySelector('meta[name="csrf-token"]').content;
    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json"
      },
      body: JSON.stringify(body)
    })
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.props.history.push(`/movies`))
      .catch(error => console.log(error.message));
  }

  render() {
    return (
      <div className="container mt-5">
        <div className="row">
          <div className="col-sm-12 col-lg-6 offset-lg-3">
            <h1 className="font-weight-normal mb-5">
              Add a new moview to our awesome collection.
            </h1>
            <form onSubmit={this.onSubmit}>
              <div className="form-group">
                <label htmlFor="movieTitle">Title</label>
                <input
                  type="text"
                  name="title"
                  id="movieTitle"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="movieSummary">Summary</label>
                <textarea
                  type="text"
                  name="summary"
                  id="movieSummary"
                  className="form-control"
                  rows="5"
                  required
                  onChange={this.onChange}
                />
              </div>
              <label htmlFor="genre">Genre</label>
              <input
                type="text"
                className="form-control"
                id="genre"
                name="genre"
                required
                onChange={this.onChange}
              />
              <label htmlFor="year">Year</label>
              <input
                type="text"
                className="form-control"
                id="year"
                name="year"
                required
                onChange={this.onChange}
              />
              <label htmlFor="rows">Rows</label>
              <input
                type="text"
                className="form-control"
                id="rows"
                name="rows"
                required
                onChange={this.onChange}
              />
              <label htmlFor="columns">Columns</label>
              <input
                type="text"
                className="form-control"
                id="columns"
                name="columns"
                required
                onChange={this.onChange}
              />
              <label htmlFor="imdb">IMDB Link</label>
              <input
                type="text"
                className="form-control"
                id="imdb"
                name="imdb_link"
                onChange={this.onChange}
              />
              <button type="submit" className="btn custom-button mt-3">
                Create Movie
              </button>
              <Link to="/movies" className="btn btn-link mt-3">
                Back to movies
              </Link>
            </form>
          </div>
        </div>
      </div>
    );
  }

}

export default NewMovie;