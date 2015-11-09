React = require "react"
{Router} = require "react-router"
{AppCanvas, AppBar} = require("material-ui")

require "./layout.less"

Layout = React.createClass
  render: ->
    <AppCanvas>
      <AppBar title="Title" iconClassNameRight="muidocs-icon-navigation-expand-more" />
      hi,
      {this.props.children}
    </AppCanvas>

module.exports = Layout