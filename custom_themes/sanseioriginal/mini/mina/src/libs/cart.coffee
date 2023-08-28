#---------------------
# Cart
#
# Author : Redy Ru
# Email : redy.ru@gmail.com
# License : MIT
# Description: Shoppoing Cart data object for store.
#---------------------

version = '1.0.1'

if not Function::property
  Function::property = (prop, methods) ->
    Object.defineProperty @prototype, prop, methods

now = ->
  return parseInt(Date.now() / 1000)


class CartStack
  constructor: (opts)->
    self = @
    if not opts or typeof(opts) isnt 'object'
      opts = {}

    default_key = 'CART_STORAGE_STACK'
    if opts.infinity
      default_key = 'CART_INFINITY_STORAGE_STACK'
      opts.expires_in = Infinity

    self.STORAGE_KEY = opts.key or default_key
    self.MAX_STORAGE = opts.limit or 60
    self.ID_KEY = opts.id_key or 'id'
    self.expires_in = opts.expires_in or (3600 * 24 * 7)
    self.refresh()

  @property 'version',
    get: ->
      return version

  @property 'key',
    get: ->
      self = @
      return self.STORAGE_KEY

  config: (opts)->
    self = @
    opts = {} if not opts
    self.MAX_STORAGE = opts.limit if opts.limit
    self.expires_in = opts.expires_in if opts.expires_in

  _limit: (list)->
    self = @
    if list.length > self.MAX_STORAGE
      list.length = self.MAX_STORAGE

  sync: (list)->
    self = @
    if not Array.isArray(list)
      list = []
    self._limit(list)
    for item in list
      item.__added = now()
    wx.setStorageSync(self.STORAGE_KEY, list)

  refresh: ->
    self = @
    cart_list = (item for item in self.list() \
      when (now() - item.__added) < self.expires_in)
    wx.setStorageSync(self.STORAGE_KEY, cart_list)

  list: ->
    self = @
    cart_list = wx.getStorageSync(self.STORAGE_KEY) or []
    self._limit(cart_list)
    return cart_list

  len: ->
    self = @
    cart_list = self.list()
    return cart_list.length

  get: (item_id)->
    self = @
    return null if not item_id
    cart_list = self.list()
    for item in cart_list
      if item[self.ID_KEY] == item_id
        return item
    return null

  add: (item)->
    self = @
    return if not item or not item[self.ID_KEY]
    cart_list = self.list()
    item.__added = now()
    cart_list.unshift(item)
    self._limit(cart_list)
    wx.setStorageSync(self.STORAGE_KEY, cart_list)

  remove: (item_or_id) ->
    self = @
    return if not item_or_id
    cart_list = self.list()
    if typeof(item_or_id) is 'object' and item_or_id
      item_id = item_or_id[self.ID_KEY]
    else
      item_id = item_or_id

    curr_idx = null
    for cart, idx in cart_list
      if cart[self.ID_KEY] == item_id
        curr_idx = idx

    if curr_idx isnt null
      cart_list.splice curr_idx, 1

    wx.setStorageSync(self.STORAGE_KEY, cart_list)

  update: (item)->
    self = @
    return if not item or not item[self.ID_KEY]
    cart_list = self.list()
    item.__added = now()  # updated added timestamp
    for cart, idx in cart_list
      if cart[self.ID_KEY] == item[self.ID_KEY]
        cart_list[idx] = item
        break
    wx.setStorageSync(self.STORAGE_KEY, cart_list)

  clear: ->
    self = @
    wx.setStorageSync(self.STORAGE_KEY, [])


module.exports = CartStack
