Todo = DS.Model.extend
  
  name: DS.attr 'string'
  isCompleted: DS.attr 'boolean'
  dueDate: DS.attr 'date'
  priority: DS.attr 'string'
  
  isActive: Em.computed.not('isCompleted')
  isEditing: false

`export default Todo`
