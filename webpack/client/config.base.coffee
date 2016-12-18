{ clientConfiguration } = require 'universal-webpack'
settings = require '../universal-webpack-settings'
configuration = require '../modules/base'


exports.getConfig = (options = {}) => clientConfiguration(configuration, settings, options)

