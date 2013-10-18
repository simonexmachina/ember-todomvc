TodoController = Em.ObjectController.extend
  isEditing: false
  allAreDone: ((key, value)->
    if value?
      @setEach 'isCompleted', value
      value
    else
      @get('length') > 0 and @everyProperty('isCompleted', true)
  ).property('@each.isCompleted')
  anyCompleted: (->
    @anyProperty 'isCompleted'
  ).property '@each.isCompleted'
  actions:
    editTodo: ->
      @set 'isEditing', true
    removeTodo: ->
      todo = @get('content')
      todo.deleteRecord()
      todo.save()

`export default TodoController`
