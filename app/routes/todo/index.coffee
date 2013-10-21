TodoIndexRoute = Em.Route.extend
  beforeModel: (transition) ->
    if !@auth.get('user')
      Em.RSVP.reject()
  actions:
    error: (reason, transition)->
      @auth.set 'afterLoginTransition', transition
      @transitionTo 'sign-in'
  model: ->
    @store.findAll 'todo'

`export default TodoIndexRoute`
