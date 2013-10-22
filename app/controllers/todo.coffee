`import ModelController from 'appkit/controllers/model'`

TodoController = ModelController.extend
  # the CSS class for the priority icon
  priorityIconClass: (->
    switch @get 'priorityLevel'
      when 0 then "icon-chevron-down"
      when 2 then "icon-chevron-up"
  ).property 'priorityLevel'
  # handles calling save() when isCompleted is changed
  isCompleted: ((key, value)->
    # if this property is being set
    if value?
      @set 'content.isCompleted', value
      @get('content').save()
    @get 'content.isCompleted'
  ).property 'content.isCompleted'
  actions:
    edit: (todo)->
      @transitionToRoute 'todo.edit', todo

`export default TodoController`
