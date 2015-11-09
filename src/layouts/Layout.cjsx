React = require "react"
{Router} = require "react-router"
{AppCanvas, AppBar} = require("material-ui")

Layout = React.createClass
  render: ->
    <AppCanvas>
      <AppBar title="Title" iconClassNameRight="muidocs-icon-navigation-expand-more" />
      {this.props.children}
    </AppCanvas>

module.exports = Layout