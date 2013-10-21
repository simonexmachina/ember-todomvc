ApplicationRoute = Em.Route.extend
  enter: ->
    @auth.bypass email: 'simon.wade@gmail.com' #debug
    @transitionTo 'todo' #debug

`export default ApplicationRoute`
