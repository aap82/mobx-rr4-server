paths = global.paths
getenv = require 'getenv'
webpack = require('webpack')
resolve = require './modules/resolve'
{getPlugins} = require './modules/plugins'
{getLoaders} = require './modules/loaders'
console.log getLoaders()

module.exports =
  devtool: 'cheap-module-source-map'
  entry: [
    'react-hot-loader/patch'
    'webpack-hot-middleware/client'
    paths.client_entry
  ]
  output:
    path: paths.output
    filename: 'bundle.js'
    publicPath: '/static/'
  plugins: getPlugins('dev')
  resolve: resolve
  module:
    loaders: getLoaders()
  sassLoader: {
    includePaths: [
      paths.app
      paths.node_modules
    ]
  },
  postcss: ->
    [
      require('autoprefixer')()
      require('postcss-extend')()
      require('postcss-focus')()
      require('postcss-url')()
      require('precss')()
      require('cssnano')()
      require('lost')()
      require('postcss-flexbugs-fixes')()
      require('postcss-custom-properties')()
      require('postcss-custom-media')()
      require('postcss-media-minmax')()
      require('postcss-custom-selectors')()
      require('postcss-calc')()
      require('postcss-nesting')()
      require('postcss-nested')()
      require('postcss-color-function')()
      require('pleeease-filters')()
      require('pixrem')()
      require('postcss-selector-matches')()
      require('postcss-selector-not')()
    ]