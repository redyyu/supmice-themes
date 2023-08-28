core = require('../../core.js')
utils = require('../../utils.js')
deco = require('../../decorators.js')
restCustomer = require('../../restapi/customer.js')


app = getApp()

core.Page
  data:
    image: core.image
    total_price: 0
    payment: 0
    use_credit: false
    credit_payment: 0
    courier_fee: 0
    items: []
    expired_items: []
    is_empty: false
    consignee: null
    profile: null
    note: ''

  direct: null
  note: ''
  submitted: false

  # lifecycle
  onLoad: deco.login_required (opts)->
    self = @
    app.set_navbar('$purchase', true)
    self.direct = opts.direct
    self.redeem = opts.redeem
    self.bargain = core.session.get('share_sid')
    app.get_profile (profile)->
      self.setData
        profile: profile
    self.check_address_authorization()
    self.load()


  # hanlders
  load: ->
    self = @
    self.setData
      loaded: false

    restCustomer.check_cart
      items: app.checkout.list()
      redeem: self.redeem
      bargain: self.bargain
    .then (cart)->
      # clear expireds
      for ex_item in cart.expired_items
        app.cart.remove(ex_item.id)

      self.setData
        loaded: true
        items: cart.items
        is_empty: not cart.items.length
        expired_items: cart.expired_items
        courier_fee: cart.courier_fee
        total_items_price: cart.total_items_price
        total_vouchers: cart.total_vouchers
        total_redeems: cart.total_redeems
        total_bargains: cart.total_bargains
        total_discount: cart.total_discount
        total_price: cart.total_price
        payment: cart.payment
        payment_with_credit: cart.payment_with_credit
        credit_payment: cart.credit_payment


  get_shipping_address: ->
    self = @
    self.check_address_authorization()
    wx.chooseAddress
      success: (info)->
        self.setData
          consignee: core.reform_consignee(info)
      fail: ->
        self.check_address_authorization()

  check_address_authorization: ->
    self = @
    core.get_authorize 'scope.address'
    , (status) ->
      if status is undefined
        status = true
      self.setData
        address_authorized: status


  input_note: (e)->
    self = @
    try
      note = e.detail.value or ''
    catch
      note = ''
    self.setData
      note: note

  toggle_use_credit: ->
    self = @
    self.setData
      use_credit: not self.data.use_credit

  use_redeem: ->
    self = @
    return if self.submitted
    self.setData
      redeem_modal_status: true

  submit_redeem: (e)->
    self = @
    try
      self.redeem = e.detail.value.redeem
    catch
      self.redeem = null
    self.load()
    self.setData
      redeem_modal_status: false

  go_back: ->
    app.nav.back()

  purchase: (e)->
    self = @
    return if self.submitted
    self.submitted = true
    consignee = self.data.consignee
    restCustomer.purchase
      name: consignee.name
      recipient: consignee.recipient
      note: self.data.note
      items: self.data.items
      redeem: self.redeem
      bargain: self.bargain
      use_credit: Boolean(self.data.use_credit)
    .then (result)->
      if result.prepay_id
        self._make_order(result)
      else
        core.toast
          title: e.currentTarget.dataset.errorTitle
          image: e.currentTarget.dataset.errorIcon
        , ->
          app.nav.back()

  _make_order: (result)->
    self = @
    wx.requestPayment
      timeStamp: result.timestamp
      nonceStr: result.nonce_str
      package: result.package
      signType: result.sign_type
      paySign: result.pay_sign

      success: (res)->
        if not self.direct
          for item in self.data.items
            app.cart.remove(item.id)
        app.checkout.clear()
        self.setData
          payment: result.payment
          courier_fee: result.courier_fee
          credit_payment: result.credit_payment
          paid: true
        restCustomer.bargain.remove()

      fail: (res)->
        restCustomer.order.cancel(result.id)
        if res.err_code
          console.error res
          self.setData
            pay_error: true
        if res.err_desc
          wx.showToast
            icon: 'none'
            title: res.err_desc
            mask: true
            duration: 2400
      complete: ->
        self.submitted = false
