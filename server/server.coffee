require 'babel-register'
config = require('./config')
passport = require('./auth/passport')
{connect} = require './database/models'
express = require 'express'

expressGraphQL = require('express-graphql')
{ buildSchema } = require('graphql')
bodyParser = require('body-parser')
cookieParser = require('cookie-parser')



app = express()

jsonParser = bodyParser.json()
cookieParser(config.jwt.secret)
app.use jsonParser
app.use bodyParser.urlencoded(extended: true)

loggingMiddleware = (req, res, next) ->
  console.log 'ip:', req.ip
  next()
  return

passport app


app.use(loggingMiddleware)





connect().then (schema) ->
  app.use '/auth', require('./routes/auth')
  app.use '/graphql', expressGraphQL({
    schema: schema
    graphiql: yes
  })
  app.listen 5000

.catch (err) ->
  console.log err