TodoRoute = Em.Route.extend
  # require login
  beforeModel: (transition) ->
    if !@auth.get('user')
      Em.RSVP.reject()
  actions:
    # retry the transition into this route if we're not logged in
    error: (reason, transition)->
      @auth.set 'afterLoginTransition', transition
      @transitionTo 'sign-in'

`export default TodoRoute`
