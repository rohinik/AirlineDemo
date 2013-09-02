calatrava.pageView ?= {}

calatrava.pageView.loungeListing = ->

  $page = $('#loungeListing')
  $p = (sel)-> $(sel, $page)

  renderMatchingLounges = ($select, data) ->
    hideAirportList()
    $select.empty().show().html ich.lounge_list_tmpl
      airport: data[0].city
      lounges: data
    $page.hide().show()

  renderMatchingAirports = ($select, data) ->
    hideLoungeList()
    $select.empty().show().html ich.airport_code_list_tmpl
      airports: data
    $page.hide().show()

  hideLoungeList = ->
    $p("#matched_lounge_list").hide()

  hideAirportList = ->
    $p("#matched_predictive_airport_codes_list").hide()

  renderSection = (key, data) ->
    switch key
      when 'matchingAirports' then renderMatchingAirports($p('#matched_predictive_airport_codes_list'), data)
      when 'matchingLounges' then renderMatchingLounges($p('#matched_lounge_list'), data)
      else $p("#" + key).val(data)

  bind: (event, handler) ->
    typingTimer = null
    doneTypingInterval = 2000
    switch event
      when 'predictive_airport_code_keyup' then $p("#predictive_airport_code").off('keyup').on 'keyup', (evt) ->
        clearTimeout(typingTimer)
        if evt.keyCode is 13 then handler()
        else typingTimer = setTimeout(handler, doneTypingInterval);
      when 'predictive_airport_code_keydown' then $p("#predictive_airport_code").off('keydown').on 'keydown', ->
        clearTimeout(typingTimer)
      when 'airport_code' then $p(".airport-link").off('click').on 'click', -> handler($(this).data('code'))
#      when 'predictive_airport_code_focus'
#        $p("#predictive_airport_code").off('focus').on 'focus', (evt) ->
#          $(this).parent().css(
#            "position": 'fixed'
#            "top": '35px'
#          )
#        $p("#predictive_airport_code").off('blur').on 'blur', (evt) ->
#          $(this).parent().css(
#            "position": 'static'
#          )


  render: (message) ->
#    $p('.result-container').css("height", (calatrava.bridge.runtime.getViewPortHeight() - 76) + 'px')
    renderSection(section, data) for own section,data of message

  get: (field) ->
    $page.find("#" + field).val()

  show: ->
    $page.show()

  hide: ->
    $page.hide()
