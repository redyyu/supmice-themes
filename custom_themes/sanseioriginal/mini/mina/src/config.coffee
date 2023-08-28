# Config
config =
  baseURL:
    api: 'https://api.julolo.com/sanseioriginal'

  default_locale: 'zh_CN'

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
