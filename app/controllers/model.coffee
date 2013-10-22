ModelController = Em.ObjectController.extend
  actions:
    delete: ->
      model = @get('content')
      model.deleteRecord()
      model.save()

`export default ModelController`
