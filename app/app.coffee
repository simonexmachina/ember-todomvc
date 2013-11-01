`import Resolver from 'resolver'`
`import Persona from 'appkit/utils/persona'`

App = Ember.Application.create
  modulePrefix: 'appkit'
  Resolver: Resolver
  ready: ->
    # @debug.logAll() #debug
    # @debug.logResolver() #debug
    @debug.globalize() #debug

`export default App`
