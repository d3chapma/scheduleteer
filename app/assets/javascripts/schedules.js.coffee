# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.schedule-cell', (event) ->
  $('.schedule-day-job-selector').hide()
  $(this).find('.schedule-day-job-selector').show()
  event.preventDefault()

$(document).on 'click', (event) ->
  unless event.isDefaultPrevented()
    $('.schedule-day-job-selector').hide()
