`import App from 'appkit/app'`

# Usage:
# {{App.DateField dateBinding="date"}} # Where "date" links to a normal Date object (new Date())
App.DateField = Em.TextField.extend
  type: 'date'
  hasFocus: false

  init: ->
    @_super()
    @updateValue()

  updateDate: (->
    if ms = Date.parse(@get('value'))
      @set('date', new Date(ms))
  ).observes('value')

  updateValue: (->
    return if @get('hasFocus')
    date = @get('date')
    if date instanceof Date
      @set('value', date.toISOString().substring(0, 10))
  ).observes('date')

  focusIn: ->
    @set('hasFocus', true)

  focusOut: ->
    @set('hasFocus', false)
    @updateValue()

`export default App.DateField`
