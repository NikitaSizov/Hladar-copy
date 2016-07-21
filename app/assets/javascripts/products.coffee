# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

linkHandler = (e)->
  link = $(e.target).attr("href")
  loadData(link)
  e.preventDefault()
  no
loadData = (link)->
  $("#product").load(link + "?no_layout=true")

$(document).ready( ()->
  $(".sidebar").find("a").click( (e) -> linkHandler(e)  )
  ###$(document).on("click", "a.link", (e) -> linkHandler(e) )
  hash = window.location.hash.substring(1);
  console.log("#{window.location.href.split('#')[0]}/#{hash}")
  try
    loadData("#{window.location.href.split('#')[0]}/#{hash}") if hash
  catch error
    console.log(error)
  no###
)
