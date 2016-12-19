require('babel-runtime/core-js/promise').default = require('bluebird');

if (__DEVELOPMENT__) {
  require('bluebird').longStackTraces();
}

require('./client');