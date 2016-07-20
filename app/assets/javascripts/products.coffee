# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready( ()->
  $(".sidebar").find("a").click( (e)->

    $("#product").load($(e.target).attr("href") + "?no_layout=true")

    e.preventDefault()
    no
  )
)
