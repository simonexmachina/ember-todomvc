Router = Ember.Router.extend() # ensure we don't share routes between all Router instances

Router.map ->
  @route 'sign-in'
  @resource 'todo', path: '/todo', ->
    @route 'index', path: '/index'
    @route 'edit', path: '/:todo_id'

`export default Router`
