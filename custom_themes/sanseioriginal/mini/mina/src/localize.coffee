# Localization

localize_map =
  en:
    tabs: ['Product', 'Shopping Cart', 'My']
    title:
      '$account': 'Account'
      '$order': 'Order Detail'
      '$cart': 'Shipping Cart'
      '$purchase': 'Purchase'
      '$error': 'Error'
  zh:
    tabs: ['商品', '购物车', '我的']
    title:
      '$account': '账户'
      '$order': '订单详情'
      '$cart': '购物车'
      '$purchase': '付款'
      '$error': '出错'


# methods
localize =
  tabs: (loc)->
    return localize_map[loc].tabs or []

  title: (loc, key)->
    return localize_map[loc].title[key]

module.exports = localize
