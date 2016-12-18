device = require('express-device')
config = require('./config')
{connect} = require './database/models'
httpProxy = require 'http-proxy'
express = require 'express'
session = require('express-session')
expressGraphQL = require('express-graphql')
{ buildSchema } = require('graphql')

bodyParser = require('body-parser')
cookieParser = require('cookie-parser')


reactRenderingService = "http://localhost:3000/"
proxy = httpProxy.createProxyServer({})
app = express()



cookieParser(config.jwt.secret)
jsonParser = bodyParser.json()



app.use jsonParser
app.use bodyParser.urlencoded(extended: true)

app.use session(
  maxAge: new Date(Date.now() + 36000000)
  secret: config.jwt.secret
  resave: false
  saveUninitialized: false)

app.use device.capture({parseUserAgent: yes})


require('./auth/passport')(app)
app.use '/auth', require('./routes/auth')

root =
  entry: (args, req) ->
    deviceName: req.device.name
    deviceType: req.device.type
    ip: if req.ip.split('f:')?[1]? then req.ip.split('f:')[1] else ''

handleRenderRequest = (request, response) ->
  proxy.web request, response, { target: reactRenderingService }, (error) ->
    console.error error
    response.status(500).send 'Proxying failed for page rendering service'
    return
  return

connect().then () ->
  schema = require('./graphql/schema').getSchema()
  app.use '/graphql', expressGraphQL({
    schema: schema
    rootValue: root
    graphiql: yes
  })
  app.use(handleRenderRequest)
  app.listen 5000

.catch (err) ->
  console.log err

#module.exports = app