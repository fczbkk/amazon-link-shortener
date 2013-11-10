asinUrlRe = ///
  # many variants of product URLs, that are always followed by ASIN
  (
    /exec/obidos/tg/detail/-/
    | /gp/product/
    | /o/ASIN/
    | /dp/
    | /dp/product/
  )
  # ASIN is always 10 alphanumeric characters
  (
    [a-z0-9]{10}
  )
  # ASIN is followed by either slash (/), question mark (?), hash (#) or
  # end of the string
  [/?#]|$
///i

getAsin = (url = '') -> (url.match asinUrlRe)[2]

getShortUrl = (asin = '', affiliateId) ->
  tag = if affiliateId then "?tag=#{affiliateId}" else ''
  "http://amzn.com/#{asin}#{tag}"
