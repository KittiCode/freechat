App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	unless data.content.blank?
      $('#message-box').append '<p class="message">' +
        '<strong class="message-user">' + data.username + ":" + '</strong>' + '</p>' +
        '<div class="message-content">' + data.content + '</div>' + '<p></p>'
      scroll_bottom()
    # Called when there's incoming data on the websocket for this channel



$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('#box').scrollTop($('#box')[0].scrollHeight)


