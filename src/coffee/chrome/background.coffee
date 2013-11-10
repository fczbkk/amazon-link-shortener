# Wait for a message from the contentscript to show the icon.
chrome.extension.onMessage.addListener (request, sender, sendResponse) ->
  if request.what is 'showIcon'
    chrome.pageAction.show sender.tab.id
  true
