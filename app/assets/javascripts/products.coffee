# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

linkHandler = (e)->
  link = $(e.target)
  loadData(link)
  e.preventDefault()
  no
loadData = (link)->
  $("#product").load(link.attr("href") + "?no_layout=true")

$(document).ready( ()->
  $(".sidebar").find("a").click( (e) -> linkHandler(e) )
  $("a.link").click( (e) -> linkHandler(e) )
)
