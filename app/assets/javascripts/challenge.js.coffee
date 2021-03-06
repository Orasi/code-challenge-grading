//= require shCore
//= require shBrushVb
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready', ->
  $("abbr.timeago").timeago()
  $(".complete_checkbox").on "change", ->
    $(this).parent().submit()
  $(".edit-btn").click (event) ->
    $(@).parent().siblings("div.comment-edit").show()
    $(@).parent().siblings("p.comment-content").hide()
    $('textarea').trigger 'autosize.resize'
    event.preventDefault()
  $(".cancel-btn").click ->
    $(@).parent("div").hide()
    $(@).parent("div").siblings("p.comment-content").show()
  $(".reply-btn").click (event) ->
    $(@).parents("div.comment-body").children(".comment-reply").show()
    event.preventDefault()
  $("#evaluate-btn").click (event) ->
    $('#submitButtonPanel').fadeOut "slow", ->
      $('#loadingPanel').fadeIn("slow").delay 2000, ->
        $("#submissionForm").submit()
    event.preventDefault()
   
