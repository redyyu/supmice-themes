core = require('../../core.js')
utils = require('../../utils.js')


app = getApp()

core.Page
  data:
    image: core.image
    total_price: 0
    item_list: []
    checked_all: false
    edit_mode: false
    is_empty: null

  # lifecycle
  onLoad: (opts)->
    self = @
    app.set_tabs()
    app.set_navbar('$cart', true)

  onShow: ->
    self = @
    self.load()

  # methods
  load: ->
    self = @

    item_list = app.cart.list()
    for item in item_list
      item._checked = true

    self.setData
      loaded: true
      item_list: item_list
      is_empty: item_list.length == 0
      checked_count: self._count_checked(item_list)
      total_price: self._total_price(item_list)


  toggle_checked_all: ->
    self = @
    item_list = self.data.item_list
    chk_count = self._count_checked(item_list)
    all_checked = chk_count >= item_list.length
    for item in item_list
      item._checked = not all_checked
    self.setData
      item_list: item_list
      checked_count: self._count_checked(item_list)
      total_price: self._total_price(item_list)

  toggle_edit_mode: (e)->
    self = @
    edit_mode = not self.data.edit_mode
    self.setData
      edit_mode: edit_mode

  check_item: (e)->
    self = @
    return if self.edit_mode
    index = e.currentTarget.dataset.itemIndex
    item_list = self.data.item_list
    item = item_list[index]
    return if not item
    item._checked = not item._checked
    item_list[index] = item
    self.setData
      item_list: item_list
      checked_count: self._count_checked(item_list)
      total_price: self._total_price(item_list)

  remove_item: (e)->
    self = @
    return if self.edit_mode
    index = e.currentTarget.dataset.itemIndex
    item_list = self.data.item_list
    item = item_list[index]
    return if not item
    app.cart.remove(item)
    item_list.splice index, 1
    edit_mode =
      if self.data.edit_mode and item_list.length == 0
      then false
      else self.data.edit_mode
    self.setData
      item_list: item_list
      checked_count: self._count_checked(item_list)
      total_price: self._total_price(item_list)
      edit_mode: edit_mode


  increase_amount: (e)->
    self = @
    index = e.currentTarget.dataset.itemIndex
    item_list = self.data.item_list
    item = item_list[index]
    return if not item
    item.amount = Math.max(item.amount += 1, 1)
    item_list[index] = item
    app.cart.update(item)
    self.setData
      item_list: item_list
      total_price: self._total_price(item_list)


  decrease_amount: (e)->
    self = @
    index = e.currentTarget.dataset.itemIndex
    item_list = self.data.item_list
    item = item_list[index]
    return if not item
    item.amount = Math.max(item.amount -= 1, 1)
    item_list[index] = item
    app.cart.update(item)
    self.setData
      item_list: item_list
      total_price: self._total_price(item_list)


  purchase: ->
    self = @
    return if not self.data.checked_count
    item_list = self.data.item_list
    checked_items = (item for item in item_list when item._checked)
    app.checkout.sync(checked_items)
    app.nav.go
      route: core.config.paths.purchase

  # helpers
  _total_price: (item_list)->
    total_price = 0
    for item in item_list
      if item._checked
        item_price = item.amount * item.price
        total_price += item_price
    return total_price

  _count_checked: (item_list)->
    count_checked = item_list.reduce (x, y) ->
      _c = if y._checked then 1 else 0
      return x + _c
    , 0
    return count_checked
