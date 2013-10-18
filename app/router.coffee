Router = Ember.Router.extend() # ensure we don't share routes between all Router instances

Router.map ->
  @route 'active'
  @route 'completed'

`export default Router`
