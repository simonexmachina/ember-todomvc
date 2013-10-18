`import Resolver from 'resolver'`
`import registerComponents from 'appkit/utils/register_components'`

App = Ember.Application.create
  modulePrefix: 'appkit'
  Resolver: Resolver
  ready: ->
    @debug.logAll()
    @debug.globalize()

`export default App`
