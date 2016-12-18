config = require('../config')
passport = require('passport')
LocalStrategy = require('passport-local').Strategy
passportJWT = require("passport-jwt")
{User} = require '../database/models'


JwtStrategy = passportJWT.Strategy
ExtractJwt = passportJWT.ExtractJwt

params =
  secretOrKey: config.jwt.secret
  jwtFromRequest: ExtractJwt.fromBodyField('token')
  passReqToCallback: true

module.exports = (app) ->
  app.use passport.initialize()
  app.use passport.session()

  passport.use new LocalStrategy((username, password, done) ->
    User.findOne(where: 'username': username).then (user) ->
      if user == null
        return done(null, false, message: 'Incorrect credentials.')
      if user.password is password
        return done(null, user)
      done null, false, message: 'Incorrect credentials.'
    return
  )

  passport.use new JwtStrategy(params, (req, payload, done) ->
    console.log payload
    User.findOne(where: 'username': payload.username).then (user) ->
      if !user?
        return done(new Error('User not found'), null)
      else if payload.password = user.password
        return done null, user
      else
        return
  )

  passport.serializeUser (user, done) ->
    done null, user.username
    return

  passport.deserializeUser (username, done) ->
    User.findOne(where: 'username': username).then (user) ->
      if user == null
        done new Error('Wrong user id.')
      done null, user
      return
    return



  return