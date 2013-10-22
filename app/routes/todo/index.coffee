TodoIndexRoute = Em.Route.extend
  # require login
  beforeModel: (transition) ->
    if !@auth.get('user')
      Em.RSVP.reject()
  actions:
    # retry the transition into this route if we're not logged in
    error: (reason, transition)->
      @auth.set 'afterLoginTransition', transition
      @transitionTo 'sign-in'
  model: ->
    # only query the server if we don't already have the set of todos
    all = @store.all('todo')
    if all?.get('length') then all
    else @store.findAll 'todo'

`export default TodoIndexRoute`
