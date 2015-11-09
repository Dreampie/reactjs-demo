React = require "react"

createHistory = require("history").createHashHistory
{Router, Route, Link, State, IndexRoute} = require "react-router"

Layout = require "./layouts/Layout"
Home = require "./Home"
Movies = require "./modules/movies/Movies"
Books = require "./modules/books/Books"

Routes =
  <Router history={createHistory queryKey: false} onUpdate={-> window.scrollTo(0, 0)}>
    <Route path="/" handler={Layout}>
      <IndexRoute component={Home}/>
      <Route path="movies" handler={Movies}>
        <Route path=":id" handler={Movies} />
      </Route>
      <Route path="books" handler={Books}>
        <Route path=":id" handler={Books} />
      </Route>
    </Route>
  </Router>

module.exports = Routes