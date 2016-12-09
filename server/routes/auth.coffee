config = require('../config')
express = require 'express'
passport = require('passport')
jwt = require('jsonwebtoken');

{User, Dashboard} = require('../database/models')
router = express.Router()
firstStart = yes

signToken = (payload) ->
  token =  jwt.sign {
      exp: Math.floor(Date.now()) + 6000 * 6000
      data: payload
    }, config.jwt.secret
  return token



registerUser = (payload, res) ->
  User.create(payload).then (user) ->
    if user?
      token = signToken payload
      res.json token: token
      Dashboard.create({title: "NewDashboard", UserId: user.id}).then (dashboard) ->
        console.log dashboard
        return



    else
      return res.sendStatus 401


checkDB = (payload, res) ->
  User.findAll().then (users) ->
    return registerUser(payload, res) if users.length is 0
    return res.sendStatus 401




router.post '/login',  (req, res) ->
  payload =
    username: req.body.username
    password: req.body.password
  User.findOne(where: 'username': payload.username).then (user) ->
    if user and user.password is payload.password
      token = signToken payload
      req.login user, (err) ->
        if err then return res.sendStatus 401
        return res.json token: token
    else
#      if firstStart? then return checkDB(payload, res)
      return res.sendStatus 401


router.post '/token',  (req, res) ->
  console.log 'hit'
  token = req.body.token
  jwt.verify token, config.jwt.secret, (err, decoded) ->
    if err then return res.sendStatus 401
    User.findOne(where: 'username': decoded.data.username).then (user) ->
      console.log user.getDashboards().then (dashboards) ->
        console.log dashboards
        if err then return res.sendStatus 401
        req.login user, (err) ->
          if err then return res.sendStatus 401
          return res.json user: decoded.data.username




module.exports = router