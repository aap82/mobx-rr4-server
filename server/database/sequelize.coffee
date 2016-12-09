fs = require 'fs'
paths = require '../..//config/paths'
path = require 'path'
Sequelize = require 'sequelize'
config = require('./config').sequelize.development

sequelize = new Sequelize("stinkhouse", null, null, config)

module.exports = sequelize