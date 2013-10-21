`import ModelController from 'appkit/controllers/model'`

TodoController = ModelController.extend
  priorityIconClass: (->
    switch @get 'priorityLevel'
      when 0 then "icon-chevron-down"
      when 1 then "icon-chevron-down"
  ).property('priorityLevel')
  save: (->
    @get('content').save()
  ).observes 'content.isCompleted'

`export default TodoController`
