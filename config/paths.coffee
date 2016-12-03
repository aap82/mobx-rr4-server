path = require('path')
root = path.join __dirname, '..'

app = path.join root, 'app'
compiled = path.join root, 'compiled'


paths =
  root: root
  app:  app
  client_entry: path.join app, 'client'
  output: path.join root, 'dist'




module.exports = paths

