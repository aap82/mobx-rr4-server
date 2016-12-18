var path = require('path')

module.exports = {
  server: {
    input: path.join(__dirname, '../app/core/server/entry.js'),
    output: path.join(__dirname, '../build/server/server.js')
  }
}