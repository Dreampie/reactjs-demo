React = require "react"

createHistory = require("history").createHashHistory
{Router, Route, Link, State, IndexRoute} = require "react-router"

Layout = require "./layouts/Layout"
Home = require "./views/Home"
Movies = require "./views/Movies"
Books = require "./views/Books"

Routes =
  <Router history={createHistory queryKey: false} onUpdate={-> window.scrollTo(0, 0)}>
    <Route path="/" handler={Layout}>
      <IndexRoute component={Home}/>
      <Route name="movies" handler={Movies}>
        <Route name="movie" path=":id" handler={Movies} />
      </Route>
      <Route name="books" handler={Books}>
        <Route name="book" path=":id" handler={Books} />
      </Route>
    </Route>
  </Router>

module.exports = Routes