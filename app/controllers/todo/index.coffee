`import dateFormat from 'appkit/helpers/date-format'`

TodoIndexController = Em.ArrayController.extend
  # initially sort by priority and dateCreated
  sortProperties: ['priority', 'dateCreated']
  sortAscending: false
  numCompleted: (->
    @filterProperty('isCompleted', true).get('length')
  ).property '@each.isCompleted'
  anyCompleted: (->
    @anyBy 'isCompleted'
  ).property '@each.isCompleted'
  actions:
    createTodo: ->
      todo = @store.createRecord 'todo', name: @get 'name'
      todo.save()
      @set 'name', null
    clearCompleted: ->
      completed = @filterProperty 'isCompleted', true
      completed.invoke 'deleteRecord'
      completed.invoke 'save'
    orderBy: (property)->
      # toggle the direction if the same property is selected again
      if @get('sortProperties')?[0] == property
        @set 'sortAscending', !@get 'sortAscending'
      else
        @set 'sortProperties', [property, 'dateCreated']

`export default TodoIndexController`
