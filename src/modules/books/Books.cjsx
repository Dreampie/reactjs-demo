React = require "react"
{Router, RouteHandler, Link} = require "react-router"

Constant = require "../../layouts/Constant"
Dispatcher = require "../../Dispatcher"

Books = React.createClass
  render: ->
    id = this.props.params.id
    if id
      <article>
        <h1>这里是图书 id 为 {id} 的详情介绍</h1>
      </article>
    else
      <ul>
        <li key={1}><Link to="/books/1">活着</Link></li>
        <li key={2}><Link to="/books/2">挪威的森林</Link></li>
        <li key={3}><Link to="/books/3">从你的全世界走过</Link></li>
      </ul>

module.exports = Books