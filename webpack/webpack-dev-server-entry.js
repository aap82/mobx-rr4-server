// require('babel-register')
require('coffee-script/register');
require('../config/global');

module.exports = require(require('path').resolve(__dirname, 'webpack-dev-server'))