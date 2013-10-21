express = require('express')
httpProxy = require('http-proxy')
passport = require('passport')
passport = require('passport')
PersonaStrategy = require('passport-persona').Strategy

passport.serializeUser (user, done)->
  done null, user.email

passport.deserializeUser (email, done)->
  done null, email: email

passport.use new PersonaStrategy
  audience: 'http://lh:8000'
, (email, done)->
  done null, email: email

ensureAuthenticated = (req, res, next)->
  console.log req
  if req.isAuthenticated() then return next()
  else res.writeHead(403, 'Login required') and res.end()

app = express()
app.use express.bodyParser()
app.use passport.initialize()
app.use app.router
app.use 

app.post '/auth/browserid',
  passport.authenticate('persona', failureRedirect: '/login')
  , (req, res)->
    res.setHeader 'Content-type', 'application/json'
    res.end JSON.stringify req.user

# ensureAuthenticated, 
app.all '/v0/*', (->
  proxy = new httpProxy.RoutingProxy()
  userPass = new Buffer('30132a35-c23c-490b-a081-b9110733e993', "ascii").toString("base64")
  (req, res)->
    req.headers.authorization = "Basic " + userPass
    proxy.proxyRequest req, res,
      host: 'api.orchestrate.io',
      port: 80
)()

module.exports = app
# module.exports.use = ->
#   app.use.apply app, arguments
