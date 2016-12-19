paths = global.paths
webpack = require 'webpack'
getenv = require 'getenv'
{getConfig} = require './config.base.coffee'
{getPlugins}= require '../modules/plugins'
plugins = getPlugins('client_dev')

host = ['http://', getenv('DEV_SERVER_HOST'), ':', getenv('DEV_SERVER_PORT')].join('')

config = getConfig({ development: true, css_bundle: true })
config.devtool = 'cheap-module-source-map'
config.plugins.push plugin for plugin in plugins
config.entry.app = [
  "webpack-dev-server/client?#{host}",
  'webpack/hot/only-dev-server',
  'react-hot-loader/patch',
  config.entry.app
]
config.output.publicPath = host + config.output.publicPath
config.module.loaders[0].query =
    presets: [['es2015', { modules: false }], 'latest', 'react'],
    plugins: [
      'transform-decorators-legacy',
      'transform-class-properties',
      'transform-runtime',
      'babel-root-import',
      'react-hot-loader/babel',
      'transform-es2015-destructuring',
      'transform-es2015-parameters',
      'transform-object-rest-spread'
    ]







module.exports = config