express = require "express"
path = require "path"
mongoose = require 'mongoose'

app = express();
server = require('http').createServer(app)

###
  Instance of DB
###
pathDBManager = './managers/db-manager'
DBManager = require pathDBManager
dbConfig =
  dbName: 'Winter'
  dbUser  : ''
  dbPass  : ''
  dbHost  : 'localhost'

mongoose.connect "mongodb://#{dbConfig.dbHost}/#{dbConfig.dbName}"


# Set configuration Environment Server
app.set 'port', process.env.PORT || '3000'
app.use express.static path.join __dirname,'../views'
app.use express.static path.join(__dirname, '../public')
app.engine '.html', require('ejs').__express
app.set 'view engine', 'html'

app.use express.logger('dev')
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router


app.configure 'development', () ->
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }))

app.configure 'production', () ->
  app.use express.errorHandler()

app.get '/', (request, respons) ->
  view = 'index'
  respons.render view

require('./routes/people-routes')(app)

srv = app.listen app.get('port'), ->
  console.log 'Listening on port %d', srv.address().port
