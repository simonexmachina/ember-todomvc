ApplicationController = Em.Controller.extend
  init: ->
    @auth.on 'signIn', this, ->
      if @get('currentPath') == 'sign-in'
        @transitionToRoute 'todo-list'

`export default ApplicationController`
