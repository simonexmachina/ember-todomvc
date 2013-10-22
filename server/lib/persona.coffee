passport = require('passport')
user = require './user'

PersonaStrategy = require('passport-persona').Strategy

passport.use new PersonaStrategy
  audience: 'http://lh:8000'
, (email, done)->
  user.isUser email: email, done
