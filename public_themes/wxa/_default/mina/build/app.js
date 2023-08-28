var Cart, Navigation, core, restCustomer, restStore, utils;

Navigation = require('libs/navigation.js');

Cart = require('libs/cart.js');

utils = require('utils.js');

core = require('core.js');

restStore = require('restapi/store.js');

restCustomer = require('restapi/customer.js');

// app
App({
  project: {
    name: 'WeChat Store Default',
    version: '2.0.0',
    creator: ['Redyyu']
  },
  // trigger
  onLaunch: function(opts) {
    var self;
    self = this;
    console.info('Launched...');
    console.info('-------------------');
    console.info(self.project.name);
    console.info(self.project.version);
    return console.info(self.project.creator.join(', '));
  },
  onShow: function(opts) {
    var self;
    self = this;
    wx.hideTabBar();
    return restStore.store.get().then(function(store) {
      var i, idx, len, tab, tabs;
      self.store = store;
      // login
      self.login();
      // tab bar
      wx.showTabBar();
      tabs = core.config.tabs[store.lang] || [];
      for (idx = i = 0, len = tabs.length; i < len; idx = ++i) {
        tab = tabs[idx];
        wx.setTabBarItem({
          index: idx,
          text: tab
        });
      }
      // attach locale to pages
      return setTimeout(function() {
        var j, len1, page, ref, results;
        ref = getCurrentPages();
        results = [];
        for (j = 0, len1 = ref.length; j < len1; j++) {
          page = ref[j];
          results.push(page.setData({
            store: store
          }));
        }
        return results;
      }, 600);
    });
  },
  // global data
  store: null,
  pages: [],
  // instances
  nav: new Navigation(),
  cart: new Cart(),
  checkout: new Cart({
    infinity: true
  }),
  // methods
  navbar_interval_id: null,
  set_navbar: function(title, text_style, bgcolor) {
    var self;
    self = this;
    if (self.navbar_interval_id) {
      clearInterval(self.navbar_interval_id);
    }
    return self.navbar_interval_id = setInterval(function() {
      var default_title, lang, locale, site_meta;
      if (!self.store) {
        return;
      }
      site_meta = self.store.site_meta || {};
      default_title = site_meta.title || site_meta.slug;
      if (self.store.locale && utils.isDict(title)) {
        locale = self.store.locale.toLowerCase();
        lang = locale.split('_')[0];
        title = title[lang] || title[locale];
      }
      wx.setNavigationBarTitle({
        title: title || default_title
      });
      if (text_style || bgcolor) {
        wx.setNavigationBarColor({
          frontColor: text_style || 'white'
        });
      }
      return clearInterval(self.navbar_interval_id);
    }, 100);
  },
  login_status: false,
  login: function(callback, force) {
    var _login, _loop, interval_id, self;
    self = this;
    if (!utils.isFunction(callback)) {
      callback = function() {};
    }
    if (core.session.get('token') && !force) {
      // logged
      callback();
    } else if (self.login_status) {
      // other process is try to login
      _loop = 60;
      return interval_id = setInterval(function() {
        if (!self.login_status && core.session.get('token')) {
          clearInterval(interval_id);
          return callback();
        } else if (_loop < 0) {
          return clearInterval(interval_id);
        } else {
          return _loop -= 1;
        }
      }, 600);
    } else {
      // try to login
      _login = function(callback, retry) {
        retry = !utils.isNumber(retry) ? 0 : retry + 1;
        if (retry >= core.config.retry) {
          wx.redirectTo({
            url: core.config.paths.error
          });
          return;
        } else if (retry > 0) {
          console.info('retry:', retry);
        }
        self.login_status = true;
        return wx.login({
          success: function(data) {
            // get session_key and serve in back-end
            return restCustomer.login({
              code: data.code
            }).then(function(auth) {
              self.login_status = false;
              core.session.set('token', auth.token, auth.expires_in - 60);
              return callback();
            }).catch(function(error) {
              self.login_status = false;
              return _login(callback, retry);
            });
          },
          fail: function() {
            self.login_status = false;
            return _login(callback, retry);
          }
        });
      };
      return _login(callback);
    }
  },
  share: function(opts) {
    var e, self, share_opts;
    self = this;
    if (!opts) {
      try {
        opts = {
          title: self.store.site_meta.title || self.store.site_meta.slug,
          src: self.store.site_meta.share_img,
          path: null
        };
      } catch (error1) {
        e = error1;
        opts = {};
      }
    }
    share_opts = {
      title: opts.title,
      imageUrl: opts.src,
      path: opts.path
    };
    return share_opts;
  },
  get_profile: function(callback) {
    var self;
    self = this;
    if (!utils.isFunction(callback)) {
      callback = function() {};
    }
    if (self.profile) {
      return callback(profile);
    } else {
      return restCustomer.member.get().then(function(profile) {
        self.profile = profile;
        return callback(profile);
      });
    }
  },
  set_profile: function(profile, callback) {
    var self;
    self = this;
    if (!utils.isFunction(callback)) {
      callback = function() {};
    }
    return restCustomer.member.update({
      meta: profile
    }).then(function(profile) {
      self.profile = profile;
      return callback(profile);
    });
  }
});
