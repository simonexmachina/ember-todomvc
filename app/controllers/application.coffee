ApplicationController = Em.Controller.extend
  init: ->
    @auth.on('signIn', this, ->
      # handle redirecting to the todo listing on login
      if ['index', 'sign-in'].contains @get('currentPath')
        @transitionToRoute 'todo.index'
    ).on('signOut', this, ->
      # re-authenticate if we logout on the sign-in page
      if ['sign-in'].contains @get('currentPath')
        navigator.id.request()
    )

`export default ApplicationController`
