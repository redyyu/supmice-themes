requests = require('libs/requests.js')
Session = require('libs/session.js')

config = require('config.js')
utils = require('utils.js')
image = require('constant/image.js')
static_title = require('constant/static_title.js')


# session
session = new Session()


# enhanced page
PageEnhanced = (opts)->
  self = @
  opts = {} if not opts
  onLoadFn = opts.onLoad or (opts)->
  onShowFn = opts.onShow or ->

  opts.onLoad = (opts)->
    self = @
    onLoadFn.call self, opts

  opts.onShow = ->
    self = @
    app = getApp()
    self.setData
      store: app.store
    onShowFn.call self

  return Page(opts)


# interceptor
requests.config.common.interceptor = (opts)->
  if not opts.url.match(/^http[s]:.*/)
    opts.url = config.baseURL.api + '/' + utils.strip(opts.url, '/')

  opts.after_reject = (res)->
    switch res.statusCode
      when 401
        to_url = config.paths.error
        session.remove('token')
      when 403
        to_url = config.paths.error
        session.remove('token')
      else
        wx.redirectTo
          url: config.paths.error

  opts.header = opts.header or {}
  token = session.get('token')
  if token and not opts.header.Authorization
    opts.header =
      Authorization: ('Bearer ' + token)
  return opts


# authorize before run
authorize_run = (opts, callback, fail_callback)->
  opts = {} if not opts
  if not utils.isFunction(callback)
    callback = ->
  if not utils.isFunction(fail_callback)
    fail_callback = ->

  wx.getSetting
    success: (data) ->
      if data.authSetting[opts.scope]
        callback(data)
      else if opts.required
        if data.authSetting[opts.scope] is undefined
          callback(data)
        else if data.authSetting[opts.scope] is false
          wx.openSetting
            success: (op_data)->
              if op_data.authSetting[opts.scope]
                callback(data)
            fail: (error)->
              fail_callback(error)
    fail: (error)->
      fail_callback(error)


# form validator
_validator =
  required: (value)->
    return /.+/i.test(value.replace(' ', ''))

_validation = (rules, value)->
  if utils.isString(rules)
    rules = [rules]
  else if not utils.isArray(rules)
    return null
  for rule in rules
    try
      if _validator[rule] and not _validator[rule](value)
         return false
    catch
      return false
  return true

form_validator =
  validate: (from_value, rules)->
    return if not utils.isDict(rules, true)
    ffv = {}
    for k, v of from_value
      ffv[k] = _validation(rules[k], v)
    for k, v of ffv
      ffv.$error = true if v is false
    return ffv

  setPristine: (ffv, field_name)->
    try
      delete ffv[field_name]
    catch e
      console.error e
    for k, v of ffv
      ffv.$error = true if v is false
    return ffv


reform_consignee = (info)->
  payload =
    name: info.userName
    detail: info.detailInfo
    tel: info.telNumber
    province: info.provinceName
    city: info.cityName
    county: info.countyName
    postal_code: info.postalCode
    recipient: [
      info.userName
      info.telNumber
      info.provinceName
      info.cityName
      info.countyName
      info.detailInfo
      '[' + info.postalCode + ']'
    ].join(' ')
  return payload


reform_userinfo = (userinfo)->
  if not userinfo
    userinfo = {}
  _gender_map =
    1: 1  # male
    2: 0  # female
    0: 2  # unknow
  info =
    country: userinfo.country or ''
    province: userinfo.province or ''
    city: userinfo.city or ''
    language: userinfo.language or 'zh_CN'
    name: userinfo.nickName or ''
    avatar: userinfo.avatarUrl or ''
    gender: _gender_map[userinfo.gender] or 0
  return info


# model
dialog =
  confirm: (opts)->
    opts = {} if not opts
    if not utils.isFunction(opts.confirm)
      opts.confirm = ->
    if not utils.isFunction(opts.cancel)
      opts.cancel = ->

    modal_opts =
      title: opts.title or ''
      content: opts.content or ''
      success: (result)->
        if result.confirm
          opts.confirm()
        else
          opts.cancel(result.cancel)
      fail: ->
        opts.cancel(null)

    if opts.confirmColor
      modal_opts.confirmColor = opts.confirmColor
    if opts.confirmText
      modal_opts.confirmText = opts.confirmText
    if opts.cancelColor
      modal_opts.cancelColor = opts.cancelColor
    if opts.cancelText
      modal_opts.cancelText = opts.cancelText

    wx.showModal(modal_opts)

  alert: (opts)->
    opts = {} if not opts
    if not utils.isFunction(opts.confirm)
      opts.confirm = ->
    modal_opts =
      title: opts.title or '',
      content: opts.content or '',
      showCancel: false
      success: (result)->
        if result.confirm
          opts.confirm()
    if opts.confirmColor
      modal_opts.confirmColor = opts.confirmColor
    if opts.confirmText
      modal_opts.confirmText = opts.confirmText

    wx.showModal(modal_opts)


module.exports =
  Page: PageEnhanced
  config: config
  session: session
  image: image
  static_title: static_title
  authorize_run: authorize_run
  form_validator: form_validator
  reform_consignee: reform_consignee
  reform_userinfo: reform_userinfo
  dialog: dialog
