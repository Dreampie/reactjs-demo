webpack = require "webpack"
version = require("../package.json").version

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
    path: "./dist"
    filename: "app.min.js"
  module:
    loaders: [
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
    extensions: ['', '.html', '.less', '.coffee', '.cjsx', '.js']
  plugins: [
    new webpack.optimize.UglifyJsPlugin
    new webpack.BannerPlugin(banner, {raw: true})
  ]
