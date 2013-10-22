`import ModelController from 'appkit/controllers/model'`

EditController = ModelController.extend
  # show the due date input if it's set or we're entering it
  showDueDate: (->
    @get('content.dueDate') or @get('enteringDueDate')
  ).property('content.dueDate', 'enteringDueDate')
  # options for the priority dropdown
  priorities: ['1-', '0-Low', '2-High'].map (value)->
    value: value
    label: value.substring 2
  # show the priority dropdown if it's set or we're entering it
  showPriority: (->
    priority = @get('content.priority') 
    (priority != '1-') or @get('enteringPriority')
  ).property('content.priority', 'enteringPriority')
  actions:
    enterDueDate: ->
      @set 'enteringDueDate', true
    enterPriority: ->
      @set 'enteringPriority', true
    blur: ->
      @set 'enteringDueDate', false
      @set 'enteringPriority', false
    submit: ->
      todo = @get('content')
      todo.save()
      @transitionToRoute 'todo.index'

`export default EditController`
