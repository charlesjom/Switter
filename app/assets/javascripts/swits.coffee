# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	update_count = ->
		count = $(this).val().length
		$("#char-left").text(count)
		if (count > 140)
			$("#new-swit-text").parent().addClass("error")
			$("#char-left").parent().addClass("tweet-limit")
			$("#swit-button").prop('disabled', true)
		else
			$("#new-swit-text").parent().removeClass("error")
			$("#char-left").parent().removeClass("tweet-limit")
			$("#swit-button").prop('disabled', false)

	$("#new-swit-text").keyup(update_count)
	$("#new-swit-text").keydown(update_count)	