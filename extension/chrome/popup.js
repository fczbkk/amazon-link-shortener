var handleAsinUpdate, urlField;

urlField = document.getElementById('shortenedUrl');

handleAsinUpdate = function(asin) {
  if (asin) {
    document.body.className = 'isSuccess';
    urlField.value = getShortUrl(asin);
    urlField.select();
    urlField.focus();
    try {
      return document.execCommand('copy');
    } catch (_error) {}
  } else {
    return document.body.className = 'isError';
  }
};

chrome.tabs.query({
  active: true
}, function(result) {
  if (result.length > 0) {
    return handleAsinUpdate(getAsin(result[0].url));
  }
});
