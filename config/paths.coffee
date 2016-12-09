path = require('path')
root = path.join __dirname, '..'

app = path.join root, 'app'
compiled = path.join root, 'compiled'
server = path.join root, 'server'
db = path.join server, 'database'
models = path.join db, 'models'

paths =
  root: root
  app:  app
  node_modules: path.join root, 'node_modules'
  client_entry: path.join app, 'client'
  output: path.join root, 'dist'
  models: models




module.exports = paths

