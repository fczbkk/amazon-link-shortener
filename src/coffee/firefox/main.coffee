widget = require 'sdk/widget'
tabs = require 'sdk/tabs'
self = require 'sdk/self'
panel = require 'sdk/panel'
clipboard = require 'sdk/clipboard'

popup = panel.Panel
  width: 400,
  # height: 350,
  contentURL: self.data.url 'popup.html'
  contentScriptFile: [
    self.data.url 'utilities.js'
    self.data.url 'popup.js'
  ]

widget = widget.Widget
  id: 'mozilla-link'
  label: 'Mozilla website'
  contentURL: self.data.url 'icon48.png'
  panel: popup

widget.on 'click', ->
  asin = getAsin tabs.activeTab.url
  popup.port.emit 'receiveActiveTab', asin
  clipboard.set getShortUrl asin if asin
