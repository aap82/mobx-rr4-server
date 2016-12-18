object = require('lodash/fp/object')
getenv = require 'getenv'
{getConfig} = require './config.base.coffee'
{getPlugins}= require '../modules/plugins'
plugins = getPlugins('server_dev')

WebpackServerHost = getenv('DEV_SERVER_HOST')
WebpackServerPort = getenv('DEV_SERVER_PORT')

base_config = getConfig()
config = object.assign({}, base_config)
publicPath =  config.output.publicPath
config.output.publicPath = ['http://', WebpackServerHost, ':', WebpackServerPort, base_config.output.publicPath].join('')
console.log config

config.plugins = config.plugins.concat plugins


config.module.loaders[0].query =
  presets: ['react', 'latest', 'stage-0'],
  plugins: [
    'transform-decorators-legacy',
    'transform-class-properties',
    'transform-runtime',
    'transform-object-rest-spread',
    'transform-react-jsx-source',
    'transform-react-jsx-self',
    "transform-es2015-destructuring",
    "transform-es2015-parameters",
    "transform-es2015-duplicate-keys",
    "transform-es2015-modules-commonjs",
  ]








module.exports = config