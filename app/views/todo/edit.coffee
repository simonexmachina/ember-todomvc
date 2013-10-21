EditView = Em.View.extend
  classNames: ['edit']
  textField: Em.TextField.extend
    todoBinding: 'parentView.controller.content'
    valueBinding: 'todo.name'
    didInsertElement: ->
      @$().focus()
    change: ->
      unless @get 'value'
        @get('controller').trigger 'removeTodo'
    focusOut: ->
      @set 'todo.isEditing', false
    insertNewline: ->
      @set 'todo.isEditing', false
  focusOut: ->
    @set 'controller.enteringDate', false

`export default EditView`
