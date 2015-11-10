React = require "react"
{Router} = require "react-router"
{AppCanvas, AppBar} = require("material-ui")

require "./layout.less"

Layout = React.createClass
  render: ->
    <div className="layout">
      <AppBar className="header" title="Title" iconClassNameRight="muidocs-icon-navigation-expand-more" />
      <div className="bodyer">
        {this.props.children}
      </div>
      <div className="footer">
        Footer
      </div>
    </div>

module.exports = Layout