ActiveRoute = Em.Route.extend
  model: ->
    @store.filter 'todos', (todo)-> todo.get 'isActive'

`export default ActiveRoute`
