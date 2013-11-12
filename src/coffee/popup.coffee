urlField = document.getElementById 'shortenedUrl'

handleAsinUpdate = (asin) ->
  if asin
    document.body.className = 'isSuccess'
    urlField.value = getShortUrl asin
    urlField.select()
    urlField.focus()
    # Copying to clipboard this way works in Chrome.
    try document.execCommand 'copy'
  else
    document.body.className = 'isError'
