webpack = require "webpack"
HtmlWebpackPlugin = require 'html-webpack-plugin'
version = require("../package.json").version
path = require('path')

banner =
  "/**\n" +
    " * reactjs-demo v" + version + "\n" +
    " * https://github.com/Dreampie/reactjs-demo\n" +
    " * Released under the MIT License.\n" +
    " */\n"

module.exports =
  devtool: 'source-map'
  debug: true
  entry: "./src/App"

  output:
    publicPath: "/dist/"
    path: "./dist"
    filename: "app.min.js"
  module:
    loaders: [
      {test: /\.css/, loader: 'style!css'},
      {test: /\.less$/, loader: 'style!css!less'},
      {test: /\.cjsx$/, loaders: ['coffee', 'cjsx']},
      {test: /\.coffee$/, loader: 'coffee'},
      {test: /\.html$/, loader: "html"},
      {test: /\.(woff|woff2)$/, loader: "url?limit=10000&minetype=application/font-woff"},
      {test: /\.(eot|svg|ttf)$/, loader: "file"},
      {test: /\.(png|jpg|gif)$/, loader: "url-loader"}
    ]
  resolveLoader:
    modulesDirectories: ['node_modules']
  resolve:
    extensions: ['', '.coffee', '.cjsx', '.js', '.html', '.less', '.css']
  plugins: [
    new webpack.optimize.UglifyJsPlugin warnings: false
    new webpack.BannerPlugin banner, raw: true
    new HtmlWebpackPlugin inject: false, template: 'src/index.html'
  ]
