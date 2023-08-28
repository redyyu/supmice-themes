core = require('../../core.js')
deco = require('../../decorators.js')
utils = require('../../utils.js')
restStore = require('../../restapi/store.js')
restCustomer = require('../../restapi/customer.js')


app = getApp()

core.Page
  data:
    profile: null
    orders: []
    is_empty: null
    has_more: false

  timestamp: null

  # lifecycle
  onLoad: deco.login_required (opts)->
    self = @
    app.set_tabs()
    app.set_navbar('$account', true)
    self.load()

  onShow: deco.login_required ->
    self = @
    app.refresh_profile (profile)->
      self.setData
        profile: profile

  onPullDownRefresh: ->
    self = @
    return if not self.data.loaded
    self.load()
    .finally ->
      wx.stopPullDownRefresh()

  onReachBottom: ->
    self = @
    return if not self.data.loaded
    if self.data.has_more is true
      self.list()

  # methods
  load: ->
    self = @
    self.timestamp = utils.now()
    self.setData
      loaded: false
      orders: []
      has_more: null

    self.list()
    .finally ->
      self.setData
        loaded: true
        is_empty: self.data.orders.length <= 0

  list: ->
    self = @
    self.setData
      is_loading: true
    restCustomer.order.list
      offset: self.data.orders.length
      t: self.timestamp
    .then (results)->
      orders = self.data.orders.concat(results)
      last_one = results[results.length - 1] or {_more: false, _count: 0}
      self.setData
        orders: orders
        has_more: last_one._more
    .finally ->
      self.setData
        is_loading: false

  open: (e)->
    self = @
    order = e.currentTarget.dataset.order
    return if not order
    app.nav.go
      route: core.config.paths.order
      args:
        id: order.id

  go_buy: ->
    app.nav.tab
      route: core.config.paths.index

  # member
  join_member: (e)->
    self = @
    encrypted_data = e.detail.encryptedData
    iv = e.detail.iv
    return if not encrypted_data or not iv
    wx.checkSession
      success: ->
        self._join(encrypted_data, iv)
      fail: ->
        app.login ->
          self._join(encrypted_data, iv)
        , true

  _join: (encrypted_data, iv)->
    self = @
    restCustomer.member.create
      encrypted_data: encrypted_data
      iv: iv
    .then (profile)->
      app.set_profile profile, (profile)->
        self.setData
          profile: profile

  sync_profile: (e)->
    self = @
    profile = core.reform_userinfo(e.detail.userInfo)
    app.set_profile profile, (profile)->
      self.setData
        profile: profile
