express = require 'express'
auth = require './lib/auth'
oio = require './lib/oio'
_ = require 'lodash'

app = express()
app.use express.cookieParser()
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.session secret: '3908hc.ah90ash'
app.use auth.passport.initialize()
app.use auth.passport.session()
app.use (req, res, next)->
  if req.url.match /^\/api\//
    auth.requireAuth req, res, next
  else
    next()
app.use app.router

authenticate = (->
  persona = auth.passport.authenticate 'persona'
  basic = auth.passport.authenticate 'basic'
  (req, res, next)->
    authenticate = if req.remoteUser then basic else persona
    authenticate req, res, next
)()

app.all '/auth/browserid', authenticate, (req, res)->
  res.setHeader 'Content-type', 'application/json'
  res.end JSON.stringify req.user

normalize = (req, data, namespace)->
  rv = {}
  rv[namespace] = {email: req.user.email}
  for name, value of data
    if name.match /^is/
      value = !!value
    rv[namespace][name] = value
  rv

app.all '/api/:collection/_create', auth.requireAuth, (req, res)->
  data = normalize req, _.extend({}, req.body, req.query), 'todo'
  console.log data
  unless data.todo.id
    data.todo.id = Math.random().toString(32).substr(2, 7)
  path = "#{req.params.collection}/#{data.todo.id}"
  oio.create path, data, res

app.all '/api/:collection/:id/set/:property/:value', auth.requireAuth, (req, res)->
  data = {}
  value = req.params.value
  data[req.params.property] = value
  data = normalize req, data, 'todo'
  path = "#{req.params.collection}/#{req.params.id}"
  console.log path, data
  oio.post path, data, res

app.post '/api/*', auth.requireAuth, (req, res)->
  path = req.url.replace(/^\/api\//, '')
  data = normalize req, _.extend({}, req.body, req.query), 'todo'
  oio.post path, data, res

proxy = (req, res)->
  path = req.url.replace(/^\/api\//, '')
  oio.proxy path, req, res

app.get '/api/*', auth.requireAuth, proxy
app.put '/api/*', auth.requireAuth, proxy
app.delete '/api/*', auth.requireAuth, proxy

module.exports = app
