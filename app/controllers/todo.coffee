TodoController = Em.ObjectController.extend
  isEditing: false
  actions:
    editTodo: ->
      @set 'isEditing', true
    removeTodo: ->
      todo = @get('content')
      todo.deleteRecord()
      todo.save()
    finishEditing: ->
      @set 'isEditing', false

`export default TodoController`
