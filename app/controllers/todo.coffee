`import ModelController from 'appkit/controllers/model'`

TodoController = ModelController.extend
  priorityIconClass: (->
    switch @get 'priorityLevel'
      when 0 then "icon-chevron-down"
      when 2 then "icon-chevron-up"
  ).property('priorityLevel')
  isCompleted: ((key, value)->
    if value?
      @set 'content.isCompleted', value
      @get('content').save()
      value
    else
      @get 'content.isCompleted'
  ).property 'content.isCompleted'
  actions:
    edit: (todo)->
      @transitionToRoute 'todo.edit', todo

`export default TodoController`
