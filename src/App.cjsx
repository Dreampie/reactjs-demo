require "material-design-lite/material.css"
require "material-design-lite/material"
require "./layouts/layout"

React = require "react"

Router = require "react-router"
Route = Router.Route
Link = Router.Link
State = Router.State
RouteHandler = Router.RouteHandler
DefaultRoute = Router.DefaultRoute;

App = React.createClass
  refresh: (view)->
    this.setState view:view
    this.render()
  upgrade: ->
    MDL.upgradeDom()

  render: ->
    <div>
      <div className="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        <header className="mdl-layout__header">
          <div className="mdl-layout__header-row">
            <span className="mdl-layout-title">React</span>
            <div className="mdl-layout-spacer"></div>
          </div>
        </header>
        <div className="mdl-layout__drawer">
          <span className="mdl-layout-title" onClick={this.refresh.bind(this, "main")}>React</span>
          <nav className="mdl-navigation">
              <a className="mdl-navigation__link" href="#" onClick={this.refresh.bind(this, "about")}>
                <i className="material-icons">info_outline</i>About
              </a>
              <a className="mdl-navigation__link" href="#" onClick={this.refresh.bind(this, "demo")}>
                <i className="material-icons">explore</i>Demo
              </a>
              <a className="mdl-navigation__link" href="#">
              <i className="material-icons">bug_report</i>Detailed
                  <label className="mdl-switch mdl-js-switch mdl-js-ripple-effect"
                    htmlFor="switch-detail"
                    style={{marginLeft:"10px",width:"auto"}}>
                  <input
                    className="mdl-switch__input"
                    id="switch-detail" type="checkbox"/>
                  <span className="mdl-switch__label"></span>
              </label>
              </a>
          </nav>
        </div>
        <main className="mdl-layout__content">
          <div>
            <nav>
              <a href="#"><Link to="movies">电影</Link></a>
              <a href="#"><Link to="books">图书</Link></a>
            </nav>
            <section>
              <RouteHandler/>
            </section>
          </div>
        </main>
      </div>
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
