require('coffee-script/register');
require('./config/global');
var getenv = require('getenv');
var path = require('path');
var webpack = require('webpack');
var proxy = require('express-http-proxy')
var proxy2 = require('express-http-proxy')
var express = require('express');
var DashboardPlugin = require('webpack-dashboard/plugin');
var devMiddleware = require('webpack-dev-middleware');
var hotMiddleware = require('webpack-hot-middleware');
var config = require('./webpack/webpack.config');
var apihost = ['http://', getenv('API_HOST'), ':', getenv('API_PORT')].join('')


var app = express();
var compiler = webpack(config);
compiler.apply(new DashboardPlugin());
app.use('/api', proxy(apihost));

app.use(devMiddleware(compiler, {
  publicPath: config.output.publicPath,
  historyApiFallback: true,
  hot: true,
  stats: {
    headers: { "Access-Control-Allow-Origin": "*" },
    colors: true,
    reasons: false,
    hash: false,
    timings: true,
    lazy: false,
    chunks: true,
    chunkModules: false,
    cached: true,
    cachedAssets: false,
  },
}));

app.use(hotMiddleware(compiler));

app.use('/semantic', express.static('/home/amit/mobx/semantic-ui/semantic/dist'))
// app.use('/api', require('./server/server'))

app.get('*', function (req, res) {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.listen(3000, function (err) {
  if (err) {
    return console.error(err);
  }

  console.log('Listening at http://localhost:3000/');
});