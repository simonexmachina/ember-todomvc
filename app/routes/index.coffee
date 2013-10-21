IndexRoute = Em.Route.extend
  enter: ->
    if @auth.get('user')
      @transitionTo 'todo.index'

`export default IndexRoute`
