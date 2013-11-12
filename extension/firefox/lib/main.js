var asinUrlRe, getAsin, getShortUrl;

asinUrlRe = /(\/exec\/obidos\/tg\/detail\/-\/|\/gp\/product\/|\/o\/ASIN\/|\/dp\/|\/dp\/product\/)([a-z0-9]{10})[\/?#]|$/i;

getAsin = function(url) {
  if (url == null) {
    url = '';
  }
  return (url.match(asinUrlRe))[2];
};

getShortUrl = function(asin, affiliateId) {
  var tag;
  if (asin == null) {
    asin = '';
  }
  tag = affiliateId ? "?tag=" + affiliateId : '';
  return "http://amzn.com/" + asin + tag;
};

var clipboard, panel, popup, self, tabs, widget;

widget = require('sdk/widget');

tabs = require('sdk/tabs');

self = require('sdk/self');

panel = require('sdk/panel');

clipboard = require('sdk/clipboard');

popup = panel.Panel({
  width: 400,
  contentURL: self.data.url('popup.html'),
  contentScriptFile: [self.data.url('utilities.js'), self.data.url('popup.js')]
});

widget = widget.Widget({
  id: 'mozilla-link',
  label: 'Mozilla website',
  contentURL: self.data.url('icon48.png'),
  panel: popup
});

widget.on('click', function() {
  var asin;
  asin = getAsin(tabs.activeTab.url);
  popup.port.emit('receiveActiveTab', asin);
  if (asin) {
    return clipboard.set(getShortUrl(asin));
  }
});
