ApplicationController = Em.Controller.extend
  init: ->
    @auth.on('signIn', this, ->
      if ['index', 'sign-in'].contains @get('currentPath')
        @transitionToRoute 'todo'
    ).on('signOut', this, ->
      if ['sign-in'].contains @get('currentPath')
        navigator.id.request()
    )

`export default ApplicationController`
