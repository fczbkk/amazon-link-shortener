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

self.port.on('receiveActiveTab', function(response) {
  return handleAsinUpdate(response);
});
