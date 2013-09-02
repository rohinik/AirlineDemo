tripbuddy ?= {}
tripbuddy.home ?= {}

tripbuddy.home.controller = ({views, changePage, ajax}) ->

  openLoungeSelector = () ->
    tripbuddy.loungeSelector.init()

  openFlightStatusQuery = () ->
    tripbuddy.flightStatus.init()

  openFlightSearchQuery = () ->
    tripbuddy.flightSearch.init()

  views.homePage.bind 'loungeFinder', openLoungeSelector
  views.homePage.bind 'goHome', -> changePage "homePage"
  views.homePage.bind 'flightStatus', openFlightStatusQuery
  views.homePage.bind 'searchFlight', openFlightSearchQuery