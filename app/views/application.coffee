ApplicationView = Em.View.extend
  didInsertElement: ->
    @$().on('click', '#auth .sign-in', ->
      navigator.id.request()
    ).on('click', '#auth .sign-out', ->
      navigator.id.logout()
    )

`export default ApplicationView`
