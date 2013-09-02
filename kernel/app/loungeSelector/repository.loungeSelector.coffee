tripbuddy ?= {}
tripbuddy.loungeSelector ?= {}

tripbuddy.loungeSelector.repository = ({ajax}) ->

  lounges = null

  refreshLounges = () ->
    ajax
      url: "static/lounge_list.json"
      method: 'GET'
      success: (responseData) =>
        lounges = JSON.parse(JSON.stringify(responseData))
      failure: (errorCode) ->
        console.warn "Lounge list is unavailable"

  if !lounges?
    refreshLounges()

  loungesForAirportCode : (airportCode) ->
    if !lounges?
      refreshLounges()
    matchingLounges = _.filter(lounges, (lounge) ->
      lounge.airport_code.toUpperCase() == airportCode.toUpperCase()
    )
    matchingLounges