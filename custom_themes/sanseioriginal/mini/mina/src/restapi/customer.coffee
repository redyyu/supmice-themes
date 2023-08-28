requests = require('../libs/requests.js')

login = (data)->
  requests.post('/customer/login', data)

join_member = (data)->
  requests.post('/customer/member', data)

get_member = (args)->
  requests.get('/customer/member', args)

update_member = (data)->
  requests.put('/customer/member', data)

check_cart = (data)->
  requests.post('/customer/cart', data)

purchase_order = (data)->
  requests.post('/customer/purchase', data)

open_customer_bargain = (data)->
  requests.post('/customer/bargain', data)

del_customer_bargain = (data)->
  requests.remove('/customer/bargain')

get_order = (order_id, args)->
  requests.get('/customer/order/'+order_id, args)

complete_order = (order_id, data)->
  requests.put('/customer/order/'+order_id, data)

cancel_pending_order = (order_id, args)->
  requests.remove('/customer/order/'+order_id, args)

list_orders = (args)->
  requests.get('/customer/order', args)


module.exports =
  login: login
  member:
    get: get_member
    create: join_member
    update: update_member
  check_cart: check_cart
  purchase: purchase_order
  bargain:
    open: open_customer_bargain
    remove: del_customer_bargain
  order:
    list: list_orders
    get: get_order
    done: complete_order
    cancel: cancel_pending_order
