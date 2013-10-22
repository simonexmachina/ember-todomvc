passport = require('passport')
user = require './user'

PersonaStrategy = require('passport-persona').Strategy

passport.use new PersonaStrategy
  audience: 'http://toptal.wades.be:8000'
, (email, done)->
  user.isUser email: email, done
