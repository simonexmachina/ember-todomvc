`import DateField from 'appkit/views/date-field'`

EditView = Em.View.extend
  classNames: ['edit']
  textField: Em.TextField.extend
    todoBinding: 'parentView.controller.content'
    valueBinding: 'todo.name'
    # focus the text input by default
    didInsertElement: ->
      @$().focus()

`export default EditView`
