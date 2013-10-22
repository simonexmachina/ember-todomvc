IndexRoute = Em.Route.extend
  enter: ->
    # redirect to the todo list of we're logged in
    if @auth.get('user')
      @transitionTo 'todo.index'

`export default IndexRoute`
