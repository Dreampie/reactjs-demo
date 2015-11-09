React = require "react"
ReactDOM = require "react-dom"
{Router} = require "react-router"

injectTapEventPlugin = require "react-tap-event-plugin"

Routes = require "./Routes"

injectTapEventPlugin()

ReactDOM.render Routes, document.getElementById 'app'

