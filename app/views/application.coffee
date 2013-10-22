ApplicationView = Em.View.extend
  didInsertElement: ->
    # sign-in/out buttons
    @$().on('click', '#auth .sign-in', ->
      navigator.id.request()
    ).on('click', '#auth .sign-out', ->
      navigator.id.logout()
    )

`export default ApplicationView`
