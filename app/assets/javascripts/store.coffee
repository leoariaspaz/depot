# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", ->
  $('.price_line form').on 'ajax:success', (e, data, status, xhr) ->
	  $('#cart').html xhr.responseText

$(document).on "page:update", ->
  $('#cart #current_item').removeClass 'item_added',  1000, "easeInBack"
  if $( "#cart" ).is( ":hidden" ) then $( "#cart" ).slideDown( "slow" );
