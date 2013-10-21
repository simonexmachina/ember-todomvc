ActiveRoute = Em.Route.extend
  model: ->
    @store.filter 'todo', (todo)-> todo.get 'isActive'

`export default ActiveRoute`
