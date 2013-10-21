ApplicationController = Em.ArrayController.extend
  allAreDone: ((key, value)->
    if value?
      @setEach 'isCompleted', value
      value
    else
      @get('length') > 0 and @everyProperty('isCompleted', true)
  ).property('@each.isCompleted')
  numCompleted: (->
    @filterProperty('isCompleted', true).get('length')
  ).property '@each.isCompleted'
  anyCompleted: (->
    @anyBy 'isCompleted'
  ).property '@each.isCompleted'
  actions:
    createTodo: ->
      todo = @store.createRecord 'todo', name: @get 'name'
      todo.save()
      @set 'name', null
    clearCompleted: ->
      completed = @filterProperty 'isCompleted', true
      completed.invoke 'deleteRecord'
      completed.invoke 'save'

`export default ApplicationController`
