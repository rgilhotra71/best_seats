import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Movies from "../components/Movies";
import NewMovie from "../components/NewMovie";
import BookMovie from "../components/BookMovie";


export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/movies" exact component={Movies} />
      <Route path="/movie" exact component={NewMovie} />
      <Route path="/movie/:id" exact component={BookMovie} />
    </Switch>
  </Router>
);