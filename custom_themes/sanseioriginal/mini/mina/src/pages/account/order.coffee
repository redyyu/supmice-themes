core = require('../../core.js')
deco = require('../../decorators.js')
utils = require('../../utils.js')
restStore = require('../../restapi/store.js')
restCustomer = require('../../restapi/customer.js')


app = getApp()

core.Page
  data:
    order: null

  submitted: false

  # lifecycle
  onLoad: deco.login_required (opts)->
    self = @
    self.order_id = opts.id
    app.set_navbar('$order', true)
    self.load()


  # methods
  load: ->
    self = @
    restCustomer.order.get(self.order_id)
    .then (order)->
      self.setData
        order: order
        order_style: _get_order_style(order)
        loaded: true

  copy: (e)->
    context = e.currentTarget.dataset.context
    return if not context
    wx.setClipboardData
      data: context

  call: ->
    app.call_service()

  complete_order: (e)->
    self = @
    return if self.submitted
    core.dialog.confirm
      title: e.currentTarget.dataset.confirmTitle
      confirm: ->
        self.submitted = true
        restCustomer.order.done(self.order_id)
        .then (order)->
          self.setData
            order: order
            order_style: _get_order_style(order)
        .finally ->
          self.submitted = false

  # helpers
  _get_order_style = (order)->
    if order.status == -1
      return 'warn'
    else if order.status == 1
      return 'primary'
    else
      return 'accent'
