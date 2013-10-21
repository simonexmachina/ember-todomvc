ApplicationController = Em.Controller.extend
  init: ->
    @auth.on 'signIn', this, ->
      if @get('currentPath') == 'sign-in'
        @transitionToRoute 'todo'

`export default ApplicationController`
