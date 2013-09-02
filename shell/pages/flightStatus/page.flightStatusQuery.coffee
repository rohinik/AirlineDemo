calatrava.pageView ?= {}

calatrava.pageView.flightStatusQuery = ->

  $page = $('#flightStatusQuery')
  $p = (sel)-> $(sel, $page)

  updateSelectedAirport = (type, airportCode) ->
    $page.find("#flightStatusesResult").empty().hide()
    $page.find("#predictiveAirportSuggestion").empty().hide()
    renderSection(type+"AirportInput", airportCode)

  renderFlightStatuses = ($select, data) ->
    $("#predictiveAirportSuggestion").empty().hide()
    $page.find("#flightStatusesResult").empty().show()
    $select.empty().html ich.flight_status_tmpl
      flights: processFlightsData(data)
    $page.hide().show()

  processFlightsData = (data) ->
    flights = []
    for each in data
      flight = {}
      flight.departure = {}
      flight.arrival = {}
      flight.flightCode = each.flight.carrier_code + '-' + each.flight.flight_number
      flight.departure.airport = each.departure.airport
      flight.departure.time = extractTime(each.departure.scheduled_time)
      flight.arrival.airport = each.arrival.airport
      flight.arrival.time = extractTime(each.arrival.scheduled_time)
      flight.duration = each.flight.duration
      flight.airline = each.flight.airline
      flight.status = each.flight.status
      flight.rawData = each
      flights.push(flight)
    flights

  extractTime = (timestamp) ->
    strTime = ""
    prefix = "AM"
    date = new Date(timestamp)
    if !isNaN(hour = date.getHours())
      if hour is 0 then hour = 12
      else if hour is 12 then prefix = "PM"
      else if hour > 12
        hour = hour % 12
        prefix = "PM"
      strTime = hour + ":" + date.getMinutes() + " " + prefix
    strTime

  renderMatchingAirports = ($select, data) ->
    $page.find("#flightStatusesResult").empty().hide()
    $page.find("#predictiveAirportSuggestion").empty().show()
    $page.find("#predictiveAirportSuggestion").insertAfter($page.find("#" + data.type + "AirportInput").parent())
    $select.empty().html ich.airport_suggestion_tmpl
      airports: data.airports
      type: data.type
    $page.hide().show()

  resetPage = ->
    $p("#flightStatusesResult").empty().hide()
    $p("#predictiveAirportSuggestion").empty().hide()
    $p("#fromAirportInput").val("")
    $p("#toAirportInput").val("")

  renderSection = (key, data) ->
    switch key
      when 'matchingAirports' then renderMatchingAirports($p('#predictiveAirportSuggestion'), data)
      when 'flightStatuses' then renderFlightStatuses($p('#flightStatusesResult'), data)
      when 'resetPage' then resetPage()
      else $p("#" + key).val(data)

  bind: (event, handler) ->
    typingTimer = null
    doneTypingInterval = 2000
    switch event
      when 'predictiveSearchFromKeyup' then $p("#fromAirportInput").off('keyup').on 'keyup', (evt) ->
        clearTimeout(typingTimer)
        if evt.keyCode is 13 then handler()
        else typingTimer = setTimeout(handler, doneTypingInterval);
      when 'predictiveSearchFromKeydown' then $p("#fromAirportInput").off('keydown').on 'keydown', ->
        clearTimeout(typingTimer)
      when 'predictiveSearchToKeyup' then $p("#toAirportInput").off('keyup').on 'keyup', (evt) ->
        clearTimeout(typingTimer)
        if evt.keyCode is 13 then handler()
        else typingTimer = setTimeout(handler, doneTypingInterval);
      when 'predictiveSearchToKeydown' then $p("#toAirportInput").off('keydown').on 'keydown', ->
        clearTimeout(typingTimer)
      when 'predictive_from_airport_code' then $p("#fromAirportInputButton").off('click').on 'click', handler
      when 'predictive_to_airport_code' then $p("#toAirportInputButton").off('click').on 'click', handler
      when 'from_airport_code' then $p(".from-airport-link").off('click').on 'click', ->
        airportCode = $(this).data('code')
        updateSelectedAirport("from", airportCode) if airportCode.length > 2
      when 'to_airport_code' then $p(".to-airport-link").off('click').on 'click', ->
        airportCode = $(this).data('code')
        updateSelectedAirport("to", airportCode) if airportCode.length > 2
      else
        $p("#" + event).off('click').on 'click', handler

  render: (message) ->
    renderSection(section, data) for own section,data of message

  get: (field) ->
    $page.find("#" + field).val()

  show: ->
    $page.show()

  hide: ->
    $page.hide()

