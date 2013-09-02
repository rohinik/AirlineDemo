tripbuddy ?= {}
tripbuddy.flightStatus ?= {}

tripbuddy.flightStatus.repository = ({ajax}) ->

  flightStatusFor : (options) ->
    url = calatrava.bridge.environment().serviceEndpoint + "/flight_status/"
    url = url + options.departureAirport + "/" + options.arrivalAirport + "/" + options.day + "/" + options.month + "/" + options.year
    ajax
      url: url
      method: "GET"
      success: (responseData) =>
        options.ifSuccess JSON.parse(responseData)
      failure: (errorCode) =>
        options.ifFailure errorCode

