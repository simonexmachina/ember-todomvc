`import ModelController from 'appkit/controllers/model'`

EditController = ModelController.extend
  showDueDate: (->
    @get('content.dueDate') or @get('enteringDueDate')
  ).property('content.dueDate', 'enteringDueDate')
  priorities: ['1-', '0-Low', '2-High'].map (value)->
    value: value
    label: value.substring 2
  showPriority: (->
    @get('content.priority') or @get('enteringPriority')
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
      @transitionToRoute 'todo'

`export default EditController`
