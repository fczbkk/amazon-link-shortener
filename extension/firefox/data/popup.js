var handleAsinUpdate;

handleAsinUpdate = function(asin) {
  var field;
  if (asin) {
    document.body.className = 'isSuccess';
    field = document.getElementById('shortenedUrl');
    field.value = "http://amzn.com/" + asin;
    field.select();
    field.focus();
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
