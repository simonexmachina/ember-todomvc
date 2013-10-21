`import Resolver from 'resolver'`
`import Persona from 'appkit/utils/persona'`

App = Ember.Application.create
  modulePrefix: 'appkit'
  Resolver: Resolver
  ready: ->
    @debug.logAll()
    # @debug.logResolver()
    @debug.globalize()

`export default App`
