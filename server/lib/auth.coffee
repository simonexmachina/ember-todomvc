passport = require('passport')
require './http'
require './persona'

passport.serializeUser (user, done)->
  done null, user.email

passport.deserializeUser (email, done)->
  done null, email: email

requireAuth = (req, res, next)->
  if req.isAuthenticated() then next()
  else
    res.writeHead(403, 'Login required')
    res.end()

module.exports =
  passport: passport
  requireAuth: requireAuth
