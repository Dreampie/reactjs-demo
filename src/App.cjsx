React = require "react"

Router = require "react-router"
Route = Router.Route
Link = Router.Link
State = Router.State
RouteHandler = Router.RouteHandler
DefaultRoute = Router.DefaultRoute;

App = React.createClass
  render: ->
    <div>
      <nav>
        <a href="#"><Link to="movies">电影</Link></a>
        <a href="#"><Link to="books">图书</Link></a>
      </nav>
      <section>
        <RouteHandler/>
      </section>
    </div>

Index = require "./views/Index"
Movies = require "./views/Movies"
Books = require "./views/Books"

routes =
  <Route handler={App}>
    <Route name="movies" handler={Movies}>
      <Route name="movie" path=":id" handler={Movies} />
    </Route>
    <Route name="books" handler={Books}>
      <Route name="book" path=":id" handler={Books} />
    </Route>
    <DefaultRoute handler={Index} />
  </Route>

# 将匹配的路由渲染到 DOM 中
Router.run routes, Router.HashLocation, (Root)->
  React.render <Root/>, document.body
