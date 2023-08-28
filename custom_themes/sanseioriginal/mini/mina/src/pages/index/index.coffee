core = require('../../core.js')
utils = require('../../utils.js')
restStore = require('../../restapi/store.js')

app = getApp()

core.Page
  data:
    meta: null
    content: ''
    has_more: null

  paged: 1
  timestamp: null

  # lifecycle
  onShareAppMessage: ->
    app.share()

  onLoad: (opts)->
    self = @
    app.set_tabs()
    self.load()

  onShow: ->
    self = @

  onPullDownRefresh: ->
    self = @
    return if not self.data.loaded
    self.load()
    .finally ->
      wx.stopPullDownRefresh()

  onReachBottom: ->
    self = @
    if self.data.has_more is true
      self.paged += 1
      self.list()

  # methods
  load: ->
    self = @
    self.paged = 1
    self.timestamp = utils.now()

    self.setData
      products: []
      has_more: null
      loaded: false

    restStore.page.get('index')
    .then (page)->
      app.set_navbar(page.meta.title)
      self.setData
        meta: page.meta
        content: page.content
        loaded: true
    .then ->
      self.list()

  list: ->
    self = @
    self.setData
      is_loading: true
    restStore.product.list
      paged: self.paged
      t: self.timestamp
    .then (results)->
      last_one = results[results.length - 1] or {_more: false, _count: 0}
      self.setData
        products: self.data.products.concat(results)
        has_more: last_one._more
    .finally ->
      self.setData
        is_loading: false

  enter: (e)->
    self = @
    item = e.currentTarget.dataset.item
    return if not item
    app.nav.go
      route: core.config.paths.item
      args:
        slug: item.slug

  enter_slide: (e)->
    self = @
    slide = e.currentTarget.dataset.slide
    return if not slide or not slide.link
    try
      item_slug = utils.strip(slide.link, '/').split('/').reverse()[0]
    catch
      return

    app.nav.go
      route: core.config.paths.item
      args:
        slug: item_slug
