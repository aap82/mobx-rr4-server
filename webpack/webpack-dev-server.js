import webpack from 'webpack';
import configuration from './client/config.dev.coffee';
import getenv from 'getenv';

const WebpackDevServer = require('webpack-dev-server');

const WebpackServerHost = getenv('DEV_SERVER_HOST');
const WebpackServerPort = getenv('DEV_SERVER_PORT');
console.log(configuration.output);
const devServerOptions = {
  quiet: false, // don’t output anything to the console
  noInfo: false, // suppress boring information
  hot: true,
  // network path for static files: fetch all statics from webpack development server
  publicPath: configuration.output.publicPath,
  watchOptions: {
    aggregateTimeout: 300, // <---------
    poll: 1000, // <---------
    ignored: /node_modules/
  },
  headers: {'Access-Control-Allow-Origin': '*'},
  stats: {colors: true, timings: true},
  historyApiFallback: true
};

const compiler = webpack(configuration);

new WebpackDevServer(compiler, devServerOptions)
.listen(
  WebpackServerPort,
  (error) => {
    if (error) {
      console.error(error.stack || error);
      throw error;
    }

    console.log('[webpack-dev-server] Running');
  }
);