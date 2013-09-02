tripbuddy ?= {}
tripbuddy.flightStatus ?= {}

tripbuddy.flightStatus.controller = ({views, repositories, changePage, ajax}) ->

  lookupFlightStatus = () ->
    departureAirport = arrivalAirport = null
    views.flightStatusQuery.get 'fromAirportInput', (airport) -> departureAirport = airport
    views.flightStatusQuery.get 'toAirportInput', (airport) -> arrivalAirport = airport
    today = new Date()
    day = today.getDate()
    month = today.getMonth() + 1
    year = today.getFullYear()
    repositories.flightStatusRepo.flightStatusFor({departureAirport, arrivalAirport, day, month, year, ifSuccess, ifFailure})

  ifSuccess = (flights) ->
    views.flightStatusQuery.render
      flightStatuses: flights

  ifFailure = (error) ->
    calatrava.bridge.log("Failure with error:" + error)

  displayLoungesForSelection = (airportCode, element) ->
    views.flightStatusQuery.render
      airportCodeSelection: {code:airportCode, element: element}

  setSelectedAirport = (matchingAirports, type) ->
    views.flightStatusQuery.render
      matchingAirports:
        airports : matchingAirports
        type: type
    views.flightStatusQuery.bind type+'_airport_code', -> displayLoungesForSelection

  lookupMatchingAirport = (type) ->
    views.flightStatusQuery.get type+'AirportInput', (searchTerm) ->
      calatrava.searchAirport airportCode: searchTerm, (matchingAirports) ->
        setSelectedAirport(matchingAirports, type)

  resetState = ->
    views.flightStatusQuery.render
      resetPage:{}

  views.flightStatusQuery.bind 'lookupFlightStatus', lookupFlightStatus
  views.flightStatusQuery.bind 'predictive_from_airport_code', () -> lookupMatchingAirport('from')
  views.flightStatusQuery.bind 'predictive_to_airport_code', () -> lookupMatchingAirport('to')
  views.flightStatusQuery.bind 'predictiveSearchFromKeyup', -> lookupMatchingAirport('from')
  views.flightStatusQuery.bind 'predictiveSearchFromKeydown'
  views.flightStatusQuery.bind 'predictiveSearchToKeyup', -> lookupMatchingAirport('to')
  views.flightStatusQuery.bind 'predictiveSearchToKeydown'


  initialize = ->
    resetState()

  initialize()