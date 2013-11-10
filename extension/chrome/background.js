chrome.extension.onMessage.addListener(function(request, sender, sendResponse) {
  if (request.what === 'showIcon') {
    chrome.pageAction.show(sender.tab.id);
  }
  return true;
});
