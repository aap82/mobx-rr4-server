getenv = require 'getenv'
BrowserSyncPlugin  = require 'browser-sync-webpack-plugin'
webhost = ['http://', getenv('WEB_HOST'), ':', getenv('WEB_PORT')].join('')

