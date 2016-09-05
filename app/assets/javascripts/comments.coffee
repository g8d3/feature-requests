# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class RenderSync.Comment extends RenderSync.View

  afterInsert: ->
    scrollLastComment()
    $('#comment_text').val('')

window.scrollLastComment = ->
  c = $('#comments')
  c.scrollTop(c.prop('scrollHeight'))

$(document).on 'turbolinks:load', ->
  scrollLastComment()
