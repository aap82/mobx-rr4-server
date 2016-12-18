{ serverConfiguration } = require 'universal-webpack'
settings = require '../universal-webpack-settings'
configuration = require '../modules/base'


exports.getConfig = => serverConfiguration(configuration, settings)