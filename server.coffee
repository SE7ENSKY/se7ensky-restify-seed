APP_NAME = 'test'
APP_VERSION = '0.0.1'

restify = require 'restify'
bunyan = require 'bunyan'

log = bunyan.createLogger name: APP_NAME
server = restify.createServer name: APP_NAME, version: APP_VERSION, log: log

require('se7ensky-restify-preflight')(server)
require('se7ensky-restify-resource')(server, log, "#{__dirname}/resources")

server.resource 'customers'

server.listen process.env.PORT or 3000
