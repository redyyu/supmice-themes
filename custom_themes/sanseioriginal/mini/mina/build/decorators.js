// Generated by CoffeeScript 2.0.2
(function() {
  var app, core, login_required;

  core = require('core.js');

  app = getApp();

  // Decorators
  login_required = function(fn) {
    var wrapped_fn;
    if (typeof fn !== 'function') {
      throw new Error('Decorator: must wrap on function.');
    }
    wrapped_fn = function(opts) {
      var self;
      self = this;
      if (core.session.get('token')) {
        return fn.call(self, opts);
      } else {
        return app.login(function() {
          return fn.call(self, opts);
        });
      }
    };
    return wrapped_fn;
  };

  module.exports = {
    login_required: login_required
  };

}).call(this);
