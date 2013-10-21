CompletedRoute = Em.Route.extend
  model: ->
    @store.filter 'todo', (todo)-> todo.get 'isCompleted'

`export default CompletedRoute`
