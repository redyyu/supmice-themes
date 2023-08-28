#---------------------
# Watcher
#
# Author : Redy Ru
# Email : redy.ru@gmail.com
# License : MIT
# Description: Watch key is change when regsiter to 'watch' handler.
#---------------------

version = '1.0.0'

class Watcher
  constructor: (page, opts)->
    self = @
    opts = {} if not opts
    self.watch_data = {}

    if not page
      console.error 'Mini Watch: Watch hanlder must attach to a Page object.'
      return false
    if typeof(page.watch) isnt 'object' or not page.watch
      return false

    data_keys = Object.keys(page.data)
    Object.keys(page.watch).map (key) ->
      self.watch_data[key] = page.data[key]
      return if key not in data_keys
      prop = {}
      prop[key] =
        enumerable: true
        configurable: true
        set: (new_val) ->
          old_val = self.watch_data[key]
          console.log old_val
          if new_val != old_val
            setTimeout (->
              page.watch[key].call page, old_val, new_val
              return
            ).bind(this), 0
          self.watch_data[key] = new_val
          return
        get: ->
          self.watch_data[key]
      Object.defineProperties page.data, prop


module.exports = Watcher
