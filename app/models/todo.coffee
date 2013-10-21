Todo = DS.Model.extend
  name: DS.attr 'string'
  isCompleted: DS.attr 'boolean'
  isActive: Em.computed.not('isCompleted')
  didChange: (->
    @save()
  ).observes 'isCompleted', 'name'

`export default Todo`
