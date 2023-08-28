requests = require('../libs/requests.js')

get_store = (args)->
  requests.get('/store', args)

get_page = (slug, args)->
  requests.get('/page/'+slug, args)

query_products = (data)->
  requests.post('/query', data)

search_products = (data)->
  requests.post('/search', data)

list_products = (args)->
  requests.get('/product', args)

get_product = (slug, args)->
  requests.get('/product/'+slug, args)

get_shelf = (slug, args)->
  requests.get('/shelf/'+slug, args)


module.exports =
  store:
    get: get_store
  page:
    get: get_page
  product:
    list: list_products
    get: get_product
    query: query_products
    search: search_products
    shelf: get_shelf
