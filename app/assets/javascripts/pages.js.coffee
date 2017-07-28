# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Poller
  constructor: (@div) ->

  interval: ->
    $(@div).data("interval") ? 3000

  url: ->
    $(@div).data("url")

  start: ->
    @intervalId = setInterval(@request, @interval())

  request: =>
    $.ajax(url: @url(), dataType: "script").always (data) =>
      @replace(data.responseText) if data.status == 200

  replace: (responseText) ->
    placeholder = $(responseText)
    partial = $($(responseText).html())
    $("div#" + $(@div).attr("id")).closest("div.polling-placeholder").html(placeholder.html())
    @stop() unless partial.data("poll")

  stop: ->
    clearInterval(@intervalId)

$ ->
  $("div[data-poll='true']").each (i, div) ->
    console.log "polling!"
    new Poller(div).start()
