Router = Ember.Router.extend() # ensure we don't share routes between all Router instances

Router.map ->
  @route 'sign-in'
  @route 'todo-list', path: '/list'

`export default Router`
