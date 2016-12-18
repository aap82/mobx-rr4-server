paths = global.paths
exclude = /node_modules/
loaders = {}

loaders.jsx =
  test: /\.js$/
  loader: 'babel-loader'
  exclude: exclude
#  include: paths.app

loaders.json =
  test: /\.json$/,
  loader: 'json'

loaders.cjsx =
  test: /\.cjsx$/
  loaders: [ 'babel', 'coffee-loader', 'cjsx-loader' ]
  exclude: exclude
#  include: paths.app

loaders.coffee =
  test: /\.coffee?$/
  loaders: [ 'coffee-loader' ]
  exclude: exclude
#  include: paths.app

loaders.css =
  test: /\.css?$/
#  exclude: exclude
  loaders: [
    'style-loader'
    'css-loader?importLoaders=2&sourceMap',
    'postcss-loader'
    'sass-loader?outputStyle=expanded&sourceMap=true&sourceMapContents=true'
  ]

loaders.scss =
  test: /\.scss?$/
#  exclude: exclude
  loaders: [
    'style-loader'
    'css-loader?importLoaders=2&sourceMap',
    'postcss-loader'
    'sass-loader?outputStyle=expanded&sourceMap=true&sourceMapContents=true'
  ]

loaders.img =
  test: /\.(jpg|png|svg)(\?.+)?$/,
  loader: 'url-loader?limit=100000'
#  include: paths.app

loaders.fonts =
  test: /\.(ttf|otf|eot|woff2?)(\?.+)?$/
  loader: 'file-loader'
#  include: paths.app

exports.getLoaders = -> (loader for key, loader of loaders)

