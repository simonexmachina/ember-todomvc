TodoIndexRoute = Em.Route.extend
  beforeModel: (transition) ->
    if !@auth.get('user')
      Em.RSVP.reject()
  actions:
    error: (reason, transition)->
      @auth.set 'afterLoginTransition', transition
      @transitionTo 'sign-in'
  model: ->
    all = @store.all 'todo'
    if all.get('length') == 0
      all = @store.findAll 'todo'
    all

`export default TodoIndexRoute`
