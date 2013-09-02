tripbuddy ?= {}
tripbuddy.flightSearch ?= {}

tripbuddy.flightSearch.init =->
  tripbuddy.flightSearch.controller
    views:
      homePage: calatrava.bridge.pages.pageNamed "flightSearch"
    changePage: calatrava.bridge.changePage
    ajax: calatrava.bridge.request

  calatrava.bridge.changePage "flightSearch"