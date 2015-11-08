React = require "react"
Router = require "react-router"
RouteHandler = Router.RouteHandler
AppBar = require("material-ui").AppBar

Layout = React.createClass
  render: ->
    <AppBar title="Title" iconClassNameRight="muidocs-icon-navigation-expand-more" />
    <RouteHandler/>

module.exports = Layout