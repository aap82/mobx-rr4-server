getenv = require 'getenv'
webpack = require('webpack')
BrowserSyncPlugin  = require 'browser-sync-webpack-plugin'
webhost = ['http://', getenv('WEB_HOST'), ':', getenv('WEB_PORT')].join('')


#exports = module.exports
dev = [
  new (webpack.optimize.OccurenceOrderPlugin)
  new (webpack.HotModuleReplacementPlugin)
  new (webpack.NoErrorsPlugin)
  new BrowserSyncPlugin({
    host: getenv('BROWSERSYNC_HOST')
    port: getenv('BROWSERSYNC_PORT')
    proxy: webhost
  }, reload: false)
]

client_prod = [
  new (webpack.optimize.OccurenceOrderPlugin)
  new (webpack.NoErrorsPlugin)
  new webpack.DefinePlugin({
    'process.env': {
      'NODE_ENV': JSON.stringify('production')
    }
  })
]

client_dev = [
  new webpack.DefinePlugin({
    'process.env': {
        NODE_ENV: JSON.stringify('development'),
        BABEL_ENV: JSON.stringify('development')
    }
    __CLIENT__: true
    __SERVER__: false
    __PRODUCTION__: false
    __DEVELOPMENT__: true

  })
  new webpack.HotModuleReplacementPlugin(),
  new webpack.optimize.DedupePlugin(),
  new webpack.optimize.OccurrenceOrderPlugin()

]

server_dev = [
  new webpack.DefinePlugin({
    'process.env': {
      NODE_ENV: JSON.stringify('production')
    }
    __CLIENT__: false,
    __SERVER__: true,
    __PRODUCTION__: false,
    __DEVELOPMENT__: true,
    __DEVTOOLS__: false
  })
  new webpack.optimize.CommonsChunkPlugin({
    names: ['vendor'],
    minChunks: Infinity,
    children: true,
    async: true,
  })


]

exports.getPlugins = (type) =>
  switch type
    when 'client_dev' then return client_dev
    when 'server_dev' then return server_dev
    when 'dev' then return dev