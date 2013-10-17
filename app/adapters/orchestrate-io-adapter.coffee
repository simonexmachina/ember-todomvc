DS.OrchestrateIOAdapter = DS.RESTAdapter.extend(
    Ember.Evented,

  apiKey: null
  baseUrl: 'http://api.orchestrate.io/v0'

  find: (store, type, id)->
    url = @urlForType store, type, id
    $.getJSON url
  findMany: (store, type, ids)->
    if ids.length == 0 then return Ember.RSVP.resolve []
    params = new Array(ids.length)
    params.push "_id:#{id}" for id in ids
    @_query store, type, params
  # Supports queries in the form:
  #   {
  #     <property to query>: <value or regex (for strings) to match>,
  #     ...
  #   }
  # Every property added to the query is an "AND" query, not "OR"
  # Example:
  #  match records with "complete: true" and the name "foo" or "bar"
  #    { complete: true, name: /foo|bar/ }
  findQuery: (store, type, query, recordArray)->
    params = []
    for property, value of query
      if !value
        throw 'Searching for empty properties is currently not supported'
      else if typeof value.test == 'function'
        throw 'Regular expressions are currently not supported '
      else
        params.push "#{property}:#{value}"
    @_query store, type, params
  findAll: (store, type)->
    @_query(store, type, ['*'])
      .then (response)->

  createRecord: (store, type, record)->
    unless id = record.get 'id'
      record.set 'id', id = @generateIdForRecord store, type, record
    @updateRecord store, type, record
  updateRecord: (store, type, record)->
    @ajax
      url: @urlForType store, type, record.get 'id'
      type: 'PUT'
      data: record.toJSON includeId: true
  deleteRecord: (store, type, record)->
    @ajax
      url: @urlForType store, type, record.get 'id'
      type: 'DELETE'

  urlForType: (store, type, id)->
    url = "#{@baseUrl}/#{@collectionForType store, type}"
    if id then url += "/#{id}"
    url
  collectionForType: (store, type)->
    type.typeKey
  _query: (store, type, params)->
    url = "#{@urlForType(store, type)}?query=#{escape params.join ' '}"
    @ajax url: url
  ajax: (options)->
    $.ajax $.extend {}, options,
      contentType: 'application/json'
      username: @apiKey
    
  generateIdForRecord: (store, type, record)->
    Math.random().toString(32).substr(2, 7)
)
