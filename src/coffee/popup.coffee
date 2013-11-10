handleAsinUpdate = (asin) ->
  if asin
    document.body.className = 'isSuccess'
    field = document.getElementById 'shortenedUrl'
    field.value = "http://amzn.com/#{asin}"
    field.select()
    field.focus()
    document.execCommand 'copy'
  else
    document.body.className = 'isError'
