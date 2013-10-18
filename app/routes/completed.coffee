CompletedRoute = Em.Route.extend
  model: ->
    @store.filter 'todos', (todo)-> todo.get 'isCompleted'

`export default CompletedRoute`
