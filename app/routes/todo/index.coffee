TodoIndexRoute = Em.Route.extend
  model: ->
    # only query the server if we don't already have the set of todos
    all = @store.all('todo')
    if all?.get('length') then all
    else @store.findAll 'todo'

`export default TodoIndexRoute`
