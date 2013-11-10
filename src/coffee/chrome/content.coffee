# Only request to display the icon when on product page.
if getAsin document.location.toString()
  chrome.extension.sendMessage {what : 'showIcon'}
