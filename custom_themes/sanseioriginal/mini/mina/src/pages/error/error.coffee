core = require('../../core.js')

app = getApp()

core.Page
  data:
    status: null

  # lifecycle
  onLoad: (opts)->
    app.set_navbar('$error', true)

  # hendler
  back: ->
    app.relaunch()
