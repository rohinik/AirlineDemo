tripbuddy ?= {}
tripbuddy.loungeSelector ?= {}

tripbuddy.loungeSelector.init =->
  tripbuddy.loungeSelector.controller
    views:
      loungeListing: calatrava.bridge.pages.pageNamed "loungeListing"
    changePage: calatrava.bridge.changePage