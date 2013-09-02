calatrava.pageView ?= {}

calatrava.pageView.homePage = ->

  $page = $('#homePage')
  $p = (sel)-> $(sel, $page)

  renderSection = (key, data) ->
    p("#" + key).val(data)

  bind: (event, handler) ->
    switch event
      when 'goHome' then $("#goHome").off('click').on 'click', handler
      else
        $p("#" + event).off('click').on 'click', handler

  render: (message) ->
    renderSection(section, data) for own section,data of message

  get: (field) ->
    $page.find("#" + field).val()

  show: ->
    $("#goHome").hide()
    $page.show()

  hide: ->
    console.log('hiding...')
    $("#goHome").show()
    $page.hide()
