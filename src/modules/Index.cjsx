React = require "react"
{Link} = require "react-router"

Index = React.createClass
  render: ->
    <div>
      <h1>Welcome,Home</h1>
      <li key={1}><Link to="/movies">电影</Link></li>
      <li key={2}><Link to="/books">书籍</Link></li>
    </div>
module.exports = Index