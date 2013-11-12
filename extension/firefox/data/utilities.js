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
