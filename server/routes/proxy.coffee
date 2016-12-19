express = require 'express'
httpProxy = require 'http-proxy'
reactRenderingService = "http://localhost:3000/"

app = express()

proxy = httpProxy.createProxyServer({})

app.use (req, res) =>
  console.log(req.url, req.user?)
  proxy.web req, res, { target: reactRenderingService }, (error) ->
    console.error error
    res.status(500).send 'Proxying failed for page rendering service'
    return
  return


module.exports = app