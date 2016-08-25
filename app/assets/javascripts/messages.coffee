# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
guid = ->
  s4 = ->
    Math.floor((1 + Math.random()) * 0x10000).toString(16).substring 1
  s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4()

class ChatView
  constructor: ->
    @user = guid()
    console.log("Logged in as" + @user)

    @el = document.querySelector(".sendform")
    @el.querySelector(".send").addEventListener("click", => @onClick())

  _send: (message) ->
    console.log "willl now send" + message
    $.ajax({
      type: "POST",
      url: "/messages",
      data: { message: {message: message, user: @user} },
      success:(data) ->
        console.log "Message saved successfully"
        console.log data
        return false
      error:(data) ->
        return false
    })


   onClick: ->
     message = @el.querySelector(".newmessage").value
     console.log message
     @_send message

window.addEventListener("DOMContentLoaded", -> new ChatView())

