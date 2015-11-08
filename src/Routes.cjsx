React = require "react"

createHistory = require("history").createHashHistory
Router = require "react-router"
Route = Router.Route
Link = Router.Link
State = Router.State
DefaultRoute = Router.DefaultRoute

Layout = require "./layouts/Layout"
Index = require "./views/Index"
Movies = require "./views/Movies"
Books = require "./views/Books"

Routes =
  <Router history={createHistory queryKey: false} onUpdate={() => window.scrollTo(0, 0)}>
    <Route handler={Layout}>
      <Route name="movies" handler={Movies}>
        <Route name="movie" path=":id" handler={Movies} />
      </Route>
      <Route name="books" handler={Books}>
        <Route name="book" path=":id" handler={Books} />
      </Route>
      <DefaultRoute handler={Index} />
    </Route>
  </Router>

module.exports = Routes