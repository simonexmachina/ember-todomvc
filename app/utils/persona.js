var Persona = Em.Object.extend(Em.Evented, {
  bypass: function( user ) {
    this.loggedIn(user);
    this.watching = true;
  },
  user: function() {
    if( this._user ) {
      return this._user;
    }
    else if( !this.watching ) {
      navigator.id.watch({
        onlogin: $.proxy(this.onLogin, this),
        onlogout: $.proxy(this.onLogout, this)
      });
      this.watching = true;
    }
  }.property('_user'),
  onLogin: function(assertion) {
    var loc = document.location, self = this;
    $.ajax({
      url: '/auth/browserid', // should be https://verifier.login.persona.org/verify, but doesn't specify CORS headers
      method: 'POST',
      data: {assertion: assertion}
    }).then(function(user) {
      self.loggedIn(user);
    }, function() {
      self.onLogout();
    });
  },
  loggedIn: function(user) {
    this.set('_user', user);
    this.trigger('signIn', user);
    var transition;
    if( transition = this.get('afterLoginTransition') ) {
      transition.retry();
    }
  },
  onLogout: function() {
    this.set('_user', null);
    this.trigger('signOut');
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
