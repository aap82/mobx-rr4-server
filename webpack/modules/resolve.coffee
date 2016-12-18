paths = global.paths


module.exports =
  alias:
    app: paths.app
    components: paths.components
  root: [
    paths.app
  ]
  extensions: ['', '.js', '.jsx', '.json', '.coffee', '.cjsx', '.css', '.scss']

