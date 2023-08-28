#---------------------
# Session
#
# Author : Redy Ru
# Email : redy.ru@gmail.com
# License : MIT
# Description: Session like wxStroage Wrapper.
#---------------------

version = '1.0.0'

if not Function::property
  Function::property = (prop, methods) ->
    Object.defineProperty @prototype, prop, methods

now = ->
  return parseInt(Date.now() / 1000)


class Session
  constructor: (opts)->
    self = @
    self.options = opts

  @property 'version',
    get: ->
      return version

  get: (key)->
    item = wx.getStorageSync(key)
    _check_item = (item)->
      return false if not item
      if item.expires_in and (now() - item.timestamp) > item.expires_in
        return false
      return true

    if _check_item(item)
      return item.value
    else
      wx.removeStorageSync(key)
      return null


  ttl: (key) ->
    item = wx.getStorageSync(key)
    if not item or (now() - item.timestamp) > item.expires_in
      wx.removeStorageSync(key)
      return 0
    else
      return item.expires_in - (now() - item.timestamp)

  set: (key, value, expires_in) ->
    _session =
      value: value
      timestamp: now()
      expires_in: expires_in or null
    wx.setStorageSync(key, _session)
    return _session

  pop: (key) ->
    self = @
    value = self.get(key)
    wx.removeStorageSync(key)
    return value

  remove: (key) ->
    wx.removeStorageSync(key)

  clear: ->
    wx.clearStorageSync()


module.exports = Session
