passport = require('passport')
require './http'
# require './persona'

passport.serializeUser (user, done)->
  done null, user.email

passport.deserializeUser (email, done)->
  done null, email: email

requireAuth = (req, res, next)->
  console.log 'requireAuth', req.isAuthenticated()
  if req.isAuthenticated() then return next()
  else
    res.writeHead(403, 'Login required')
    res.end()

module.exports =
  passport: passport
  requireAuth: requireAuth
