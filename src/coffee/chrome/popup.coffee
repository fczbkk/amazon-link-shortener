# get active tab
chrome.tabs.query {active: true}, (result) ->
  # if active tab exists, use it's URL go check for ASIN
  if result.length > 0
    handleAsinUpdate getAsin result[0].url
