calatrava.searchAirport = (data, onOkExecute) ->
  okCallbackHandle = calatrava.bridge.plugins.rememberCallback(onOkExecute)
  calatrava.bridge.plugins.call 'airportSelector', 'selectAirport',
    message: data
    okHandler: okCallbackHandle