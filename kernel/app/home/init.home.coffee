tripbuddy ?= {}
tripbuddy.home ?= {}

tripbuddy.home.start =->
  tripbuddy.home.controller
    views:
      homePage: calatrava.bridge.pages.pageNamed "homePage"
    changePage: calatrava.bridge.changePage
    ajax: calatrava.bridge.request

  calatrava.bridge.changePage "homePage"