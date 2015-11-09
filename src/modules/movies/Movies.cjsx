React = require "react"
{Router, RouteHandler, Link} = require "react-router"

Movies = React.createClass
  render: ->
    id = this.props.params.id
    if id
      <article>
        <h1>这里是电影 id 为 {id} 的详情介绍</h1>
      </article>
    else
      <ul>
        <li key={1}><Link to="/movies/1">煎饼侠</Link></li>
        <li key={2}><Link to="/movies/2">捉妖记</Link></li>
        <li key={3}><Link to="/movies/3">西游记之大圣归来</Link></li>
      </ul>

module.exports = Movies