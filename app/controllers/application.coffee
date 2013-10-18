ApplicationController = Em.ArrayController.extend
  actions:
    createTodo: ->
      todo = @store.createRecord 'todo', name: @get 'name'
      todo.save()
      @set 'name', null

`export default ApplicationController`
