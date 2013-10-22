request = require 'request'
http = require 'http'
apiKey = '30132a35-c23c-490b-a081-b9110733e993'
_ = require 'lodash'

oio = (method, path, query, body, callback)->
  options =
    method: method
    uri: "http://api.orchestrate.io/v0" + path
    query: query
    headers: 
      'Content-type': 'application/json'
    auth:
      user: apiKey
      pass: ''
  if method != 'GET' then options.body = JSON.stringify body
  request(options, callback)

proxy = (req, res)->
  oio(req.method, req.url, req.query, req.body).pipe res

post = (path, values, res)->
  oio 'GET', path, null, null, (err, getResponse, body)->
    if err then return handleError getResponse
    data = _.merge JSON.parse(body), values
    oio 'PUT', path, null, data, (err, putResponse, body)->
      if err then return handleError getResponse
      oio('GET', path).pipe res

create = (path, data, res)->
  oio 'PUT', path, null, data, (err, putResponse, body)->
    if err then return handleError putResponse
    oio('GET', path).pipe res

handleError = (oioRes)->
  console.error(err)
  oioRes.pipe res

module.exports = 
  proxy: proxy
  post: post
  create: create
