React = require "react"
Router = require "react-router"
Link = Router.Link
State = Router.State

Movies = React.createClass
  mixins: [State],
  render: ->
    id = this.getParams().id
    if id
      <article>
        <h1>这里是电影 id 为 {id} 的详情介绍</h1>
      </article>
    else
      <ul>
        <li key={1}><Link to="movie" params={{id: 1}}>煎饼侠</Link></li>
        <li key={2}><Link to="movie" params={{id: 2}}>捉妖记</Link></li>
        <li key={3}><Link to="movie" params={{id: 3}}>西游记之大圣归来</Link></li>
      </ul>

module.exports = Movies