EditController = Em.ObjectController.extend
  showDueDate: (->
    @get('content.dueDate') or @get('enteringDate')
  ).property('content.dueDate', 'enteringDate')
  actions:
    enterDueDate: ->
      @set 'enteringDate', true
    blur: ->
      @set 'enteringDate', false
    submit: ->
      todo = @get('content')
      todo.save()
      @transitionToRoute 'todo'
    delete: ->
      todo = @get('content')
      todo.deleteRecord()
      todo.save()

`export default EditController`
