calatrava.pageView ?= {}

calatrava.pageView.flightSearch = ->

  $page = $('#flightSearch')
  $p = (sel)-> $(sel, $page)

  render: (message) ->

  get: (field) ->
    $page.find("#" + field).val()

  show: ->
    $page.show()

  hide: ->
    $page.hide()