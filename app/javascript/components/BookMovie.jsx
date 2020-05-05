import React from "react";
import { Link } from "react-router-dom";

class BookMovie extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      movie: {
        id: "",
        title: "",
        summary: "",
        genre: "",
        year: "",
        rows: "",
        columns: "",
        imdb_link: ""
      },
      seats: "",
      best_seats: ""
    };

    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  componentDidMount() {
    const {
      match: {
        params: { id }
      }
    } = this.props;

    const url = '/api/v1/movies/'+ id;

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ movie: response }))
      .catch(() => this.props.history.push("/movies"));
  }

  onChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  onSubmit(event) {
    event.preventDefault();
    const seats = this.state.seats;
    const url = "/api/v1/movies/" + this.state.movie.id + '/best_seat?seats=' + seats;

    if (seats.length == 0)
      return;

    const body = {
      seats
    };

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => {
      debugger;
      this.setState({ best_seats: response.seats })})
      .catch(error => console.log(error.message));
  }

  render() {
    const { movie, seats, best_seats } = this.state
    return (
      <div className="container mt-5">
        <div className="row">
          <div className="col-sm-12 col-lg-6 offset-lg-3">
            <h1 className="font-weight-normal mb-5">
              Get the best Seats available.
            </h1>
            <h5 className="card-title">{movie.title}</h5>
            <h6>{movie.summary}</h6> 
            <p>{movie.genre}</p>
            <form onSubmit={this.onSubmit}>
              <div className="form-group">
                <label htmlFor="seats">Number of Seats</label>
                <input
                  type="text"
                  name="seats"
                  id="seats"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group" id="bestSeats">
                Best seats available are: <label htmlFor="bestSeats">{best_seats}</label>
              </div>
              <button type="submit" className="btn custom-button mt-3">
                Get Best Seats
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

export default BookMovie;
