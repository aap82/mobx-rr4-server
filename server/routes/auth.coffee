config = require('../config')
express = require 'express'
passport = require('passport')
jwt = require("jwt-simple")

{User, Dashboard} = require('../database/models')
router = express.Router()
firstStart = yes

signToken = (payload) ->
  token =  jwt.encode(payload, config.jwt.secret)
#      exp: Math.floor(Date.now()) + 6000 * 6000
#      data: payload
#    }, config.jwt.secret
  return token




router.post '/login',  (req, res) ->
  payload =
    username: req.body.username
    password: req.body.password
  User.findOne(where: 'username': payload.username).then (user) ->
    if user and user.password is payload.password
      token = signToken payload
      req.login user, (err) ->
        if err
          console.log err
          return res.sendStatus 401
        else
          return res.json token: token

    else
      return res.sendStatus 401


router.post '/token', passport.authenticate('jwt', session: true), (req, res, next) ->
  console.log req.user?
  return res.json id: req.user.id, user: req.user.username

#router.post '/token', (req, res) ->
#  token = req.body.token
#  jwt.verify token, config.jwt.secret, (err, decoded) ->
#    if err then return res.sendStatus 401
#    console.log req.login
#    User.findOne(where: {'username': decoded.data.username}).then (user) ->
#      if err then return res.sendStatus 401
#      req.login user, (err) ->
#        console.log err
#        if err then return res.sendStatus 401
#        return res.json user: decoded.data.username
#
#
##
##router.post '/token', passport.authenticate('local', session: true), (req, res) ->
##  return res.json user: req.user.username
##  console.log 'hit'
##  token = req.body.token
##  jwt.verify token, config.jwt.secret, (err, decoded) ->
##    return res.json user: req.user.username
##    req.body.username = decoded.data.username
##    req.body.password = decoded.data.password
##    if err then return res.sendStatus
##    passport.authenticate('local',
##    User.findOne(where: 'username': decoded.data.username).then (user) ->
##      console.log user.getDashboards().then (dashboards) ->
##        console.log dashboards
##        if err then return res.sendStatus 401
##        req.login user, (err) ->
##          if err then return res.sendStatus 401
##          return res.json user: decoded.data.username
#
#
#

module.exports = router