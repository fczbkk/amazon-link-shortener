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

chrome.tabs.query({
  active: true
}, function(result) {
  if (result.length > 0) {
    return handleAsinUpdate(getAsin(result[0].url));
  }
});
