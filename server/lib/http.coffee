passport = require 'passport'
user = require './user'

BasicStrategy = require('passport-http').BasicStrategy

passport.use new BasicStrategy (username, password, done)->
  console.log 'BasicStrategy', username, password
  user.isUser email: username, done
