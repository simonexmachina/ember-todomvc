app = require './lib/app'
express = require 'express'

app.use express.static './dist'
app.listen process.env.PORT || 8000
