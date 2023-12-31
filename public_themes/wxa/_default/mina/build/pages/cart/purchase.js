// Generated by CoffeeScript 2.0.2
(function() {
  var app, core, deco, restCustomer, restStore, utils;

  core = require('../../core.js');

  utils = require('../../utils.js');

  deco = require('../../decorators.js');

  restStore = require('../../restapi/store.js');

  restCustomer = require('../../restapi/customer.js');

  app = getApp();

  core.Page({
    data: {
      image: core.image,
      total_price: 0,
      payment: 0,
      use_credit: false,
      spent_credit: 0,
      exchange_payment: 0,
      courier_fee: 0,
      items: [],
      expired_list: [],
      is_empty: false,
      consignee: null,
      logged: null
    },
    direct: null,
    note: '',
    submitted: false,
    // lifecycle
    onLoad: deco.login_required(function(opts) {
      var self;
      self = this;
      app.set_navbar(core.static_title.purchase);
      self.direct = opts.direct;
      self.setData({
        items: [],
        expired_list: [],
        is_empty: false,
        logged: true
      });
      return self.load_cart();
    }),
    // hanlders
    load_cart: function() {
      var self;
      self = this;
      return restCustomer.check_cart({
        items: app.checkout.list()
      }).then(function(cart) {
        if (self.data.use_credit) {
          cart.payment -= cart.exchange_payment;
        }
        return self.setData({
          items: cart.items,
          is_empty: !cart.items.length,
          expired_list: cart.expired_items,
          courier_fee: cart.courier_fee,
          total_price: cart.total_price,
          voucher_price: cart.total_vouchers,
          payment: cart.payment,
          spent_credit: cart.spent_credit,
          exchange_payment: cart.exchange_payment
        });
      });
    },
    get_shipping_address: function() {
      var self;
      self = this;
      return core.authorize_run({
        scope: 'scope.address',
        required: true
      }, function(info) {
        return wx.chooseAddress({
          success: function(info) {
            return self.setData({
              consignee: core.reform_consignee(info)
            });
          }
        });
      });
    },
    input_note: function(e) {
      var self;
      self = this;
      try {
        return self.note = e.detail.value || '';
      } catch (error) {
        return self.note = '';
      }
    },
    toggle_use_credit: function(e) {
      var payment, self, use_credit;
      self = this;
      payment = self.data.payment;
      use_credit = Boolean(e.detail.value[0]);
      if (use_credit) {
        payment -= self.data.exchange_payment;
      } else {
        payment += self.data.exchange_payment;
      }
      return self.setData({
        payment: payment,
        use_credit: use_credit
      });
    },
    goback: function() {
      return app.nav.back();
    },
    purchase: function(e) {
      var consignee, self;
      self = this;
      if (self.submitted) {
        return;
      }
      self.submitted = true;
      consignee = self.data.consignee;
      return restCustomer.purchase({
        name: consignee.name,
        recipient: consignee.recipient,
        note: self.note,
        items: self.data.items,
        use_credit: Boolean(self.data.use_credit)
      }).then(function(result) {
        var err_content, err_title;
        if (result.prepay_id) {
          return self._make_order(result);
        } else {
          err_title = e.currentTarget.dataset.errTitle || 'Failed';
          err_content = e.currentTarget.dataset.errContent;
          return dialog.alert({
            title: err_title,
            content: err_content,
            confirm: function() {
              return self.load_cart();
            }
          });
        }
      });
    },
    _make_order: function(result) {
      var self;
      self = this;
      return wx.requestPayment({
        timeStamp: result.timestamp,
        nonceStr: result.nonce_str,
        package: result.package,
        signType: result.sign_type,
        paySign: result.pay_sign,
        success: function(res) {
          var i, item, len, ref;
          if (!self.direct) {
            ref = self.data.items;
            for (i = 0, len = ref.length; i < len; i++) {
              item = ref[i];
              app.cart.remove(item.id);
            }
          }
          app.checkout.clear();
          return self.setData({
            paid: true
          });
        },
        fail: function(res) {
          restCustomer.order.cancel(result.id);
          if (res.err_code) {
            console.error(res);
            self.setData({
              pay_error: true
            });
          }
          if (res.err_desc) {
            return wx.showToast({
              icon: 'none',
              title: res.err_desc,
              mask: true,
              duration: 2400
            });
          }
        },
        complete: function() {
          return self.submitted = false;
        }
      });
    }
  });

}).call(this);
