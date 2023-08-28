# Config
config =
  baseURL:
    api: 'http://192.168.1.147:5000/wxs/interface/redy/ministore'

  tabs:
    en: ['Product', 'Shopping Cart', 'My']
    zh: ['商品', '购物车', '我的']

  paths:
    index: '/pages/index/index'
    item: '/pages/index/item'
    cart: '/pages/cart/cart'
    purchase: '/pages/cart/purchase'
    account: '/pages/account/account'
    order: '/pages/account/order'
    error: '/pages/error/error'

  retry: 3


module.exports = config
