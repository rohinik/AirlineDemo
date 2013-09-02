calatrava.searchLounge = (data, onOkExecute) ->
  okCallbackHandle = calatrava.bridge.plugins.rememberCallback(onOkExecute)
  calatrava.bridge.plugins.call 'loungeSelector', 'selectLounge',
                                message: data
                                okHandler: okCallbackHandle