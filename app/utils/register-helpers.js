Ember.onLoad('Ember.Application', function(Application) {
  return Application.initializer({
    name: "registerHelpers",
    initialize: function(container, application) {
      for( var module in requirejs._defined ) {
        if( module.match(/helpers\/.*?/) ) {
          require(module);
        }
      }
    }
  });
});

