// Generated by CoffeeScript 2.0.2
(function() {
  var app, core, deco, restCustomer, utils;

  core = require('../../core.js');

  utils = require('../../utils.js');

  deco = require('../../decorators.js');

  restCustomer = require('../../restapi/customer.js');

  app = getApp();

  core.Page({
    data: {
      image: core.image,
      total_price: 0,
      payment: 0,
      use_credit: false,
      credit_payment: 0,
      courier_fee: 0,
      items: [],
      expired_items: [],
      is_empty: false,
      consignee: null,
      profile: null,
      note: ''
    },
    direct: null,
    note: '',
    submitted: false,
    // lifecycle
    onLoad: deco.login_required(function(opts) {
      var self;
      self = this;
      app.set_navbar('$purchase', true);
      self.direct = opts.direct;
      self.redeem = opts.redeem;
      self.bargain = core.session.get('share_sid');
      app.get_profile(function(profile) {
        return self.setData({
          profile: profile
        });
      });
      self.check_address_authorization();
      return self.load();
    }),
    // hanlders
    load: function() {
      var self;
      self = this;
      self.setData({
        loaded: false
      });
      return restCustomer.check_cart({
        items: app.checkout.list(),
        redeem: self.redeem,
        bargain: self.bargain
      }).then(function(cart) {
        var ex_item, i, len, ref;
        ref = cart.expired_items;
        // clear expireds
        for (i = 0, len = ref.length; i < len; i++) {
          ex_item = ref[i];
          app.cart.remove(ex_item.id);
        }
        return self.setData({
          loaded: true,
          items: cart.items,
          is_empty: !cart.items.length,
          expired_items: cart.expired_items,
          courier_fee: cart.courier_fee,
          total_items_price: cart.total_items_price,
          total_vouchers: cart.total_vouchers,
          total_redeems: cart.total_redeems,
          total_bargains: cart.total_bargains,
          total_discount: cart.total_discount,
          total_price: cart.total_price,
          payment: cart.payment,
          payment_with_credit: cart.payment_with_credit,
          credit_payment: cart.credit_payment
        });
      });
    },
    get_shipping_address: function() {
      var self;
      self = this;
      self.check_address_authorization();
      return wx.chooseAddress({
        success: function(info) {
          return self.setData({
            consignee: core.reform_consignee(info)
          });
        },
        fail: function() {
          return self.check_address_authorization();
        }
      });
    },
    check_address_authorization: function() {
      var self;
      self = this;
      return core.get_authorize('scope.address', function(status) {
        if (status === void 0) {
          status = true;
        }
        return self.setData({
          address_authorized: status
        });
      });
    },
    input_note: function(e) {
      var note, self;
      self = this;
      try {
        note = e.detail.value || '';
      } catch (error) {
        note = '';
      }
      return self.setData({
        note: note
      });
    },
    toggle_use_credit: function() {
      var self;
      self = this;
      return self.setData({
        use_credit: !self.data.use_credit
      });
    },
    use_redeem: function() {
      var self;
      self = this;
      if (self.submitted) {
        return;
      }
      return self.setData({
        redeem_modal_status: true
      });
    },
    submit_redeem: function(e) {
      var self;
      self = this;
      try {
        self.redeem = e.detail.value.redeem;
      } catch (error) {
        self.redeem = null;
      }
      self.load();
      return self.setData({
        redeem_modal_status: false
      });
    },
    go_back: function() {
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
        note: self.data.note,
        items: self.data.items,
        redeem: self.redeem,
        bargain: self.bargain,
        use_credit: Boolean(self.data.use_credit)
      }).then(function(result) {
        if (result.prepay_id) {
          return self._make_order(result);
        } else {
          return core.toast({
            title: e.currentTarget.dataset.errorTitle,
            image: e.currentTarget.dataset.errorIcon
          }, function() {
            return app.nav.back();
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
          self.setData({
            payment: result.payment,
            courier_fee: result.courier_fee,
            credit_payment: result.credit_payment,
            paid: true
          });
          return restCustomer.bargain.remove();
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
