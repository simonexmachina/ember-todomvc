Todo = DS.Model.extend
  
  name: DS.attr 'string'
  isCompleted: DS.attr 'boolean'
  dueDate: DS.attr 'date'
  priority: DS.attr 'string', default: '1-'
  dateCreated: DS.attr 'date'

  isActive: Em.computed.not('isCompleted')
  isEditing: false

  adapterWillCommit: ->
    if !@get('dateCreated') and !@get('isDeleted')
      @set 'dateCreated', new Date()

  priorityName: (->
    if priority = @get 'priority'
      priority.substring 2
  ).property 'priority'
  priorityLevel: (->
    if priority = @get 'priority'
      +priority.substring 0, 1
  ).property 'priority'

`export default Todo`
