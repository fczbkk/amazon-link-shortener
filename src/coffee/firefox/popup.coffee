self.port.on 'receiveActiveTab', (response) ->
  handleAsinUpdate response
