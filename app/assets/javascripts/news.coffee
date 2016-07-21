# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

linkHandler = (e)->
  link = $(e.target).attr("href")
  loadData(link)
  e.preventDefault()
  no
loadData = (link)->
  $("#news-modal").load(link + "?no_layout=true", ()->
    $('#news-modal').modal('show')
    )


$(document).ready(() ->
  $("a.link").click((e)-> linkHandler(e))
  )
