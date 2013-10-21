EditTodoView = Em.TextField.extend
  className: ['edit']
  valueBinding: 'todo.title'
  didInsertElement: ->
    @$().focus()
  change: ->
    unless @get 'value'
      @get('controller').trigger 'removeTodo'
  focusOut: ->
    @finishEditing()
  insertNewline: ->
    @finishEditing()
  finishEditing: ->
    @set 'controller.isEditing', false

`export default EditTodoView`
