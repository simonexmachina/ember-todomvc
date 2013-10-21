TodoListRoute = Em.Route.extend
  model: ->
    @store.findAll 'todo'

`export default TodoListRoute`
