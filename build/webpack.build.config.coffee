webpack = require "webpack"
HtmlWebpackPlugin = require 'html-webpack-plugin'
TransferWebpackPlugin = require 'transfer-webpack-plugin'
version = require("../package.json").version

banner =
  "/**\n" +
    " * reactjs-demo v" + version + "\n" +
    " * https://github.com/Dreampie/reactjs-demo\n" +
    " * Released under the MIT License.\n" +
    " */\n"

module.exports =
  devServer:
    contentBase: 'dist'
  devtool: 'source-map'
  entry: "./src/App"
  output:
    publicPath: "/"
    path: "./dist"
    filename: "js/app.min.js"
    chunkFilename: "js/[name].min.js"
  module:
    loaders: [
      {test: /\.css/, loader: 'style!css'},
      {test: /\.less$/, loader: 'style!css!less'},
      {test: /\.cjsx$/, loaders: ['react-hot', 'coffee', 'cjsx']},
      {test: /\.coffee$/, loader: 'coffee'},
      {test: /\.(woff|woff2)$/, loader: "url?limit=10000&minetype=application/font-woff"},
      {test: /\.(eot|svg|ttf)$/, loader: "file"},
      {test: /\.(png|jpg|gif)$/, loader: "url-loader"}
    ]
  resolveLoader:
    modulesDirectories: ['node_modules']
  resolve:
    extensions: ['', '.coffee', '.cjsx', '.js', '.html', '.less', '.css']
  plugins: [
    new HtmlWebpackPlugin inject: false, template: 'src/index.html'
    new webpack.optimize.UglifyJsPlugin compress:
      warnings: false
    new webpack.BannerPlugin banner, raw: true
    new webpack.NoErrorsPlugin()
    new TransferWebpackPlugin([
      from: 'assets'
    ], "src")
  ]
