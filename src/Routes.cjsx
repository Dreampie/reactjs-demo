React = require "react"

createHistory = require("history").createHashHistory
{Router, Route, Link, State, IndexRoute} = require "react-router"

Layout = require "react-router?name=layouts/layout!./layouts/Layout"
Index = require "react-router?name=modules/index!./modules/Index"
Movies = require "react-router?name=modules/movies/movies!./modules/movies/Movies"
Books = require "react-router?name=modules/books/books!./modules/books/Books"

Routes =
  <Router history={createHistory queryKey: false} onUpdate={-> window.scrollTo(0, 0)}>
    <Route path="/" component={Layout}>
      <IndexRoute component={Index}/>
      <Route path="movies" component={Movies}>
        <Route path=":id" component={Movies} />
      </Route>
      <Route path="books" component={Books}>
        <Route path=":id" component={Books} />
      </Route>
    </Route>
  </Router>

module.exports = Routes