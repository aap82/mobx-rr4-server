require('../../config/global')
paths = global.paths
getenv = require 'getenv'
webpack = require('webpack')
resolve = require './resolve'

{getLoaders} = require './loaders'

configuration =
  context: paths.root
  progress: true
  entry:
    app: paths.client_entry
    vendor: [
      'react'
      'react-dom'
      'react-router'
      'mobx'
      'mobx-react'
      'lodash'
    ]

  output:
    path: paths.client_build
    filename: '[name].[hash].js',
    publicPath: '/assets/'
    chunkFilename: '[name].[hash].js'
  resolve: resolve
  module:
    loaders: getLoaders()
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
    plugins: []

module.exports = configuration