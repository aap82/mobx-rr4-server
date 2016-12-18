jwt = require('jsonwebtoken')
config = require('../config')

defaultGridProps =
  phone:
    cols: 3
    rowHeight: 60
    marginX: 5
    marginY: 5
  tablet:
    cols: 6
    rowHeight: 87
    marginX: 5
    marginY: 5
  desktop:
    cols: 10
    rowHeight: 125
    marginX: 10
    marginY: 10


exports.getGridProps = (type) ->
  props = if defaultGridProps[type]? then defaultGridProps[type] else defaultGridProps.desktop
  return props



exports.signToken = (payload) ->
  token =  jwt.sign {
    exp: Math.floor(Date.now()) + 6000 * 6000
    data: payload
  }, config.jwt.secret
  return token