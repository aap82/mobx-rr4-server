path = require('path')
root = path.join __dirname, '..'

app = path.join root, 'app'
compiled = path.join root, 'compiled'
server = path.join root, 'server'
db = path.join server, 'database'
models = path.join db, 'models'
build = path.join root, 'build'
assets = path.join build, 'assets'

server_entry = path.join app, 'core/server/entry.js'
client_entry = path.join app, 'core/client/entry.js'

server_build = path.join build, 'server'
client_build = path.join build, 'client'


paths =
  root: root
  app:  app
  node_modules: path.join root, 'node_modules'
  client_entry: client_entry
  output: path.join root, 'dist'
  build: build
  assets: assets
  models: models
  components: path.join app, 'components'

  client_build: client_build



module.exports = paths

