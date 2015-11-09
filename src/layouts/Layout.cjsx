React = require "react"
{Router} = require "react-router"
{AppCanvas, AppBar} = require("material-ui")

require "./layout.less"

Layout = React.createClass
  render: ->
    <AppCanvas>
      <AppBar title="Title" iconClassNameRight="muidocs-icon-navigation-expand-more" />
      <div class="content">
        {this.props.children}
      </div>
    </AppCanvas>

module.exports = Layout