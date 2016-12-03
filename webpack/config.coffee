paths = global.paths
getenv = require 'getenv'
webpack = require('webpack')
BrowserSyncPlugin  = require 'browser-sync-webpack-plugin'
webhost = ['http://', getenv('WEB_HOST'), ':', getenv('WEB_PORT')].join('')

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

  plugins: [
    new (webpack.optimize.OccurenceOrderPlugin)
    new (webpack.HotModuleReplacementPlugin)
    new (webpack.NoErrorsPlugin)
    new BrowserSyncPlugin({
      host: getenv('BROWSERSYNC_HOST')
      port: getenv('BROWSERSYNC_PORT')
      proxy: webhost
    }, reload: false)
  ]

  resolve:
    root: paths.app
    modulesDirectories: ['node_modules', paths.app]
    extensions: ['', '.js', '.jsx', '.coffee', '.cjsx', '.css', '.scss']


  module:
    loaders: [
      {
        test: /\.(js|jsx)?$/
        loaders: [ 'babel' ]
        include: paths.app
      }
      {
        test: /\.cjsx$/
        loaders: [ 'babel', 'coffee-loader', 'cjsx-loader' ]
        include: paths.app
      }
      {
        test: /\.coffee?$/
        loaders: [ 'coffee-loader' ]
        include: paths.app
      }
      {
        test: /\.css$/,
        loaders: ['style', 'css', 'postcss']
#        include: paths.app
      }
      {
        test: /\.scss$/
        loaders: ['style', 'css', 'postcss', 'sass']
        include: paths.app
      }
    ]

  postcss: ->
    [
      require('autoprefixer')()
      require('postcss-extend')()
      require('postcss-focus')()
      require('postcss-url')()
      require('precss')()
      require('cssnano')()
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