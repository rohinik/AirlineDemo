tripbuddy ?= {}
tripbuddy.loungeSelector ?= {}

tripbuddy.loungeSelector.controller = ({views, changePage}) ->

  showMatchingAirports = (matchingAirports) ->
    views.loungeListing.render
      matchingAirports: matchingAirports
    views.loungeListing.bind 'airport_code', displayLoungesForSelection

  lookupMatchingAirport = () ->
    views.loungeListing.get 'predictive_airport_code', (searchTerm) ->
      calatrava.searchAirport airportCode: searchTerm, showMatchingAirports

  displayLounge = (lounges) ->
    views.loungeListing.render
      matchingLounges: lounges

  displayLoungesForSelection = (airportCode) ->
    calatrava.searchLounge airportCode: airportCode, displayLounge

  views.loungeListing.bind 'predictive_airport_code_keyup', lookupMatchingAirport
  views.loungeListing.bind 'predictive_airport_code_keydown'
  views.loungeListing.bind 'predictive_airport_code_focus'

  initialize = ->
    changePage("loungeListing")
    displayLoungesForSelection("AMS")

  initialize()