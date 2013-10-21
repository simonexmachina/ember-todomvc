TodoController = Em.ObjectController.extend
  save: (->
    @get('content').save()
  ).observes 'content.isCompleted'

`export default TodoController`
