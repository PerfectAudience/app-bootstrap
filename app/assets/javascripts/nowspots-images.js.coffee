#= require jquery.mousewheel
#= require jquery.jscrollpane
#= require date.format

track_click = (event, json, link_opened) ->
  NowspotsTracker.track_click(event, json, link_opened)

track = (event, json) ->
  NowspotsTracker.track(event, json)

initialize_events = ->

jQuery ->
  initialize_events()
