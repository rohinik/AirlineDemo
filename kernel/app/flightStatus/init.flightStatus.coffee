tripbuddy ?= {}
tripbuddy.flightStatus ?= {}

tripbuddy.flightStatus.init =->
  tripbuddy.flightStatus.controller
    views:
      flightStatusQuery: calatrava.bridge.pages.pageNamed "flightStatusQuery"
    repositories:
      flightStatusRepo: tripbuddy.flightStatus.repository({ajax:calatrava.bridge.request})
    changePage: calatrava.bridge.changePage
    ajax: calatrava.bridge.request

  calatrava.bridge.changePage("flightStatusQuery")