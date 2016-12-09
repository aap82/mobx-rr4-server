passport = require('passport')
LocalStrategy = require('passport-local').Strategy
{ User } = require '../database'

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