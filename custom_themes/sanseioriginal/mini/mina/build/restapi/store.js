// Generated by CoffeeScript 2.0.2
(function() {
  var get_page, get_product, get_shelf, get_store, list_products, query_products, requests, search_products, shelf_bargain;

  requests = require('../libs/requests.js');

  get_store = function(args) {
    return requests.get('/store', args);
  };

  get_page = function(slug, args) {
    return requests.get('/page/' + slug, args);
  };

  query_products = function(data) {
    return requests.post('/query', data);
  };

  search_products = function(data) {
    return requests.post('/search', data);
  };

  list_products = function(args) {
    return requests.get('/product', args);
  };

  get_product = function(slug, args) {
    return requests.get('/product/' + slug, args);
  };

  get_shelf = function(slug, args) {
    return requests.get('/shelf/' + slug, args);
  };

  shelf_bargain = function(slug, data) {
    return requests.post('/shelf/' + slug + '/bargain', data);
  };

  module.exports = {
    store: {
      get: get_store
    },
    page: {
      get: get_page
    },
    product: {
      list: list_products,
      get: get_product,
      query: query_products,
      search: search_products,
      shelf: get_shelf
    },
    bargain: shelf_bargain
  };

}).call(this);