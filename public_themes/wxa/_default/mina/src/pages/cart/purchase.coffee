core = require('../../core.js')
utils = require('../../utils.js')
deco = require('../../decorators.js')
restStore = require('../../restapi/store.js')
restCustomer = require('../../restapi/customer.js')


app = getApp()

core.Page
  data:
    image: core.image
    total_price: 0
    payment: 0
    use_credit: false
    spent_credit: 0
    exchange_payment: 0
    courier_fee: 0
    items: []
    expired_list: []
    is_empty: false
    consignee: null
    logged: null

  direct: null
  note: ''
  submitted: false

  # lifecycle
  onLoad: deco.login_required (opts)->
    self = @
    app.set_navbar(core.static_title.purchase)
    self.direct = opts.direct
    self.setData
      items: []
      expired_list: []
      is_empty: false
      logged: true

    self.load_cart()


  # hanlders
  load_cart: ->
    self = @
    restCustomer.check_cart
      items: app.checkout.list()
    .then (cart)->
      if self.data.use_credit
        cart.payment -= cart.exchange_payment
      self.setData
        items: cart.items
        is_empty: not cart.items.length
        expired_list: cart.expired_items
        courier_fee: cart.courier_fee
        total_price: cart.total_price
        voucher_price: cart.total_vouchers
        payment: cart.payment
        spent_credit: cart.spent_credit
        exchange_payment: cart.exchange_payment


  get_shipping_address: ->
    self = @
    core.authorize_run
      scope: 'scope.address'
      required: true
    , (info)->
      wx.chooseAddress
        success: (info)->
          self.setData
            consignee: core.reform_consignee(info)

  input_note: (e)->
    self = @
    try
      self.note = e.detail.value or ''
    catch
      self.note = ''

  toggle_use_credit: (e)->
    self = @
    payment = self.data.payment
    use_credit = Boolean(e.detail.value[0])
    if use_credit
      payment -= self.data.exchange_payment
    else
      payment += self.data.exchange_payment
    self.setData
      payment: payment
      use_credit: use_credit

  goback: ->
    app.nav.back()

  purchase: (e)->
    self = @
    return if self.submitted
    self.submitted = true
    consignee = self.data.consignee
    restCustomer.purchase
      name: consignee.name
      recipient: consignee.recipient
      note: self.note
      items: self.data.items
      use_credit: Boolean(self.data.use_credit)
    .then (result)->
      if result.prepay_id
        self._make_order(result)
      else
        err_title = e.currentTarget.dataset.errTitle or 'Failed'
        err_content = e.currentTarget.dataset.errContent
        dialog.alert
          title: err_title
          content: err_content
          confirm: ->
            self.load_cart()

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
          paid: true

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
