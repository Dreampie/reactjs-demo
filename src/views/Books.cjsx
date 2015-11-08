React = require "react"
Router = require "react-router"
RouteHandler = Router.RouteHandler
Link = Router.Link
State = Router.State

Constant = require "../layouts/Constant"
Dispatcher = require "../Dispatcher"

Books = React.createClass
  mixins: [State]
  render: ->
    id = this.getParams().id
    if id
      <article>
        <h1>这里是图书 id 为 {id} 的详情介绍</h1>
      </article>
    else
      <ul>
        <li key={1}><Link to="book" params={{id: 1}}>活着</Link></li>
        <li key={2}><Link to="book" params={{id: 2}}>挪威的森林</Link></li>
        <li key={3}><Link to="book" params={{id: 3}}>从你的全世界走过</Link></li>
      </ul>

module.exports = Books