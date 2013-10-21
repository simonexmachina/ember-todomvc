var Persona = Em.Object.extend(Em.Evented, {
  init: function() {
    navigator.id.watch({
      onlogin: $.proxy(this.onLogin, this),
      onlogout: $.proxy(this.onLogout, this)
    });
  },
  onLogin: function(assertion) {
    var loc = document.location, self = this;
    $.ajax({
      url: '/auth/browserid', // should be https://verifier.login.persona.org/verify, but doesn't specify CORS headers
      method: 'POST',
      data: {assertion: assertion}
    }).then(function(user) {
      self.set('user', user);
      self.trigger('signIn', user);
    }, function() {
      self.trigger('signOut', user);
      self.onLogout();
    });
  },
  onLogout: function() {
    console.log(arguments);
    debugger;
  }
});


Ember.onLoad('Ember.Application', function(Application) {
  return Application.initializer({
    name: "persona",
    initialize: function(container, application) {
      application.register('auth:persona', Persona);
      ['controller', 'route', 'view'].forEach(function(type) {
        application.inject(type, 'auth', 'auth:persona');
      });
    }
  });
});

export default Persona;
