if (getAsin(document.location.toString())) {
  chrome.extension.sendMessage({
    what: 'showIcon'
  });
}
