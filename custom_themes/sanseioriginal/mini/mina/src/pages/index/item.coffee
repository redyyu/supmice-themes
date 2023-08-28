core = require('../../core.js')
utils = require('../../utils.js')
deco = require('../../decorators.js')
restStore = require('../../restapi/store.js')
restCustomer = require('../../restapi/customer.js')


app = getApp()

core.Page
  data:
    meta: {}
    content: ''
    amount: 1
    shelf: null
    sku_list: []
    sel_sku: null
    sheet_status: false
    sku_status: null
    display_rules: false
    image: core.image
    action_type: null

  slug: null
  sel_attrs: {}

  # lifecycle
  onShareAppMessage: (opts)->
    self = @
    meta = self.data.meta

    if meta
      try
        img_src = meta.featured_img.src
      catch e
        img_src = ''

      title = meta.title or null
      share_path = core.config.paths.item + '?slug=' + meta.slug
      if opts.target and opts.target.id == 'bargain-share'
        share_sid = core.session.get('share_sid') or ''
        share_ticket = core.session.get('share_ticket') or ''
        try
          share_path += '&sid=' + share_sid + '&ticket=' + share_ticket
        catch e
          console.error e
      console.info share_path
      share_obj =
        title: title
        src: img_src
        path: share_path
    else
      share_obj = {}

    self.close_bargain_modal()
    app.share(share_obj)


  onLoad: (opts)->
    self = @
    self.slug = opts.slug
    self.load()
    .then ->
      self.make_bargain(opts.sid, opts.ticket)


  onShow: ->
    self = @
    self.setData
      count_cart_items: app.cart.list().length


  # methods
  load: ->
    self = @
    self.setData
      loaded: false

    restStore.product.get self.slug
    .then (product)->
      app.set_navbar(product.meta.title)
      self.setData
        meta: product.meta
        content: core.purify_content_img(product.content)
    .then ->
      restStore.product.shelf self.slug
    .then (data)->
      # init selectable attrs
      if utils.isArray(data.shelf.spec, true)
        for spec in data.shelf.spec
          self.sel_attrs[spec.key] = null
        data.shelf.spec = self._organize_spec(data.shelf.spec, data.sku_list)
      self.setData
        loaded: true
        shelf: data.shelf
        sku_list: data.sku_list
        sku_status: self._check_sku_status(data.sku_list)
        discounts: data.discounts
        bargain: data.bargain


  toggle_rules_display: (e)->
    self = @
    display_status = Boolean(e.currentTarget.dataset.display)
    self.setData
      display_rules: display_status

  close_bargain_modal: ->
    self = @
    self.setData
      bargain_modal_status: false

  make_bargain: (sid, ticket)->
    self = @
    return if not sid or not ticket or self._has_bargained(ticket)
    opts =
      sid: sid
      refresh: true
    restStore.bargain(self.slug, opts)
    .then (report)->
      self._record_bargained(ticket, report.sid, report.expires_in - 60)


  open_customer_bargain: deco.login_required ->
    self = @
    shelf = self.data.shelf
    return if not shelf
    restCustomer.bargain.open
      sid: core.session.get('share_sid')
      item_id: shelf.commodity_id
    .then (res)->
      if res.sid
        core.session.set('share_sid', res.sid, res.expires_in - 60)
        core.session.set('share_ticket', res.ticket, res.expires_in - 60)
        self._record_bargained(res.ticket, res.sid, res.expires_in - 60)
        res.remain_hours = utils.parse_int(res.expires_in / 3600 * 10) / 10
        self.setData
          bargain_report: res
          bargain_modal_status: true
      else
        self.setData
          bargain_report: null
          bargain_modal_status: false


  goto_cart: ->
    app.nav.tab
      route: core.config.paths.cart

  open_sheet: (e)->
    self = @
    self.setData
      action_type: e.currentTarget.dataset.actionType
      shelf: self._clear_shelf_selected()
      sel_sku: null
      amount: 1
      sheet_status: true

  select_spec: (e)->
    self = @
    spec_key = e.currentTarget.dataset.specKey
    curr_opt_idx = e.currentTarget.dataset.optIndex
    curr_selected = e.currentTarget.dataset.selected
    curr_spec = false
    shelf_spec = self.data.shelf.spec
    for spec in shelf_spec
      if spec.key == spec_key
        curr_spec = spec
    return if not curr_spec

    for opt, idx in curr_spec.options
      opt.selected = if idx == curr_opt_idx then not curr_selected else false
    if curr_selected
      self.sel_attrs[curr_spec.key] = null
    else
      self.sel_attrs[curr_spec.key] = curr_spec.options[curr_opt_idx].value
    self.data.shelf.spec = self._organize_spec(shelf_spec, self.data.sku_list)

    self.setData
      sel_sku: self._find_selected_sku()
      amount: 1
      shelf: self.data.shelf


  increase_amount: ->
    self = @
    curr_sku = self.data.sel_sku or {qty: 1}
    amount = Math.max(self.data.amount += 1, 1)
    self.setData
      amount: Math.min(amount, curr_sku.qty)

  decrease_amount: ->
    self = @
    amount = Math.max(self.data.amount -= 1, 1)
    self.setData
      amount: amount

  buy: (e)->
    self = @
    action_type = e.currentTarget.dataset.actionType
    self.setData
      action_type: null
      sheet_status: false

    sku = self.data.sel_sku
    return if not sku

    cart_item =
      id: sku.id
      item_id: sku.commodity_id
      name: sku.name
      figure: self._get_sku_figure_src(sku)
      detail: sku.detail
      attrs: sku.attrs
      hash: sku.hash
      signature: sku.signature
      price: if sku.dis_price isnt null then sku.dis_price else sku.price
      amount: self.data.amount
      discounts: self._get_discount_tagnames()

    # purchase
    if action_type is 'purchase'
      app.checkout.sync([cart_item])
      app.nav.go
        route: core.config.paths.purchase
        args:
          direct: true

    # add to cart
    else
      old_cart_item = app.cart.get(cart_item.id)
      if old_cart_item
        cart_item.amount += old_cart_item.amount
        app.cart.update(cart_item)
      else
        app.cart.add(cart_item)

      self.setData
        count_cart_items: app.cart.list().length

  # helpers
  _check_sku_status: (sku_list)->
    if not sku_list or sku_list.length <= 0
      return 0
    count_qty = sku_list.reduce (x, y) ->
      return x + y.qty
    , 0
    if count_qty > 0
      return 1
    else
      return 2

  _organize_spec: (shelf_spec, sku_list)->
    self = @
    __check_opt_in_skus = (k, v, skus) ->
      for sku in skus
        return true if sku.attrs[k] == v
      return false

    __sel_option = (opts)->
      for op in opts
        return op if op.selected
      return {}

    stock_list = (sku for sku in sku_list when sku.qty > 0)
    for spec in shelf_spec
      _tmp_list = stock_list
      for s in shelf_spec
        continue if s.key == spec.key
        sel_op = __sel_option(s.options)
        if sel_op.value
          _tmp_list = (sku for sku in _tmp_list \
                       when sku.attrs[s.key] == sel_op.value)
      for opt in spec.options
        if __check_opt_in_skus(spec.key, opt.value, _tmp_list)
          opt.disabled = false
        else
          opt.disabled = true

    return shelf_spec

  _clear_shelf_selected: ->
    self = @
    for spec in self.data.shelf.spec
      for op in spec.options
        delete op.selected
    return self.data.shelf

  _find_selected_sku: ->
    self = @
    if not self.data.shelf.is_various
      if self.data.sku_list[0] and self.data.sku_list[0].qty > 0
        return self.data.sku_list[0]
      else
        return null

    for k, v of self.sel_attrs
      return null if not v

    __match_attrs = (sku)->
      for k, v of self.sel_attrs
        return false if sku.attrs[k] != v
      return true

    for sku in self.data.sku_list
      if __match_attrs(sku)
        return sku
    return null

  _get_sku_figure_src: (sku)->
    self = @
    if not self.data.shelf or not utils.isArray(self.data.shelf.spec)
      return ''
    for spec in self.data.shelf.spec
      for opt in spec.options
        if sku.attrs[spec.key] == opt.value and opt.src
          return opt.src
    return self.data.meta.featured_img.src or ''

  _get_discount_tagnames: ->
    self = @
    try
      return (discount.tagname for discount in self.data.discounts)
    catch e
      return null


  _has_bargained: (ticket)->
    bargained = core.session.get('bargained')
    bargained = {} if not utils.isObject(bargained)
    if Object.keys(bargained).length > 60
      return true
    return Boolean(bargained[ticket])

  _record_bargained: (ticket, sid, expires_in)->
    return if not sid or not ticket
    bargained = core.session.get('bargained') or {}
    bargained = {} if not utils.isObject(bargained)
    bargained[ticket] = sid
    if Object.keys(bargained).length > 60
      return true
    core.session.set('bargained', bargained, expires_in)
    return true
