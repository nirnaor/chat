# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
guid = ->
  s4 = ->
    Math.floor((1 + Math.random()) * 0x10000).toString(16).substring 1
  s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4()

document.scrollDown = ->
	el = $("tbody").first()
	el.animate({ scrollTop: el.prop("scrollHeight")}, 1000)

class ChatView
  constructor: ->
    console.log "constructor"
    setInterval (=> @_refresh()), 2000
    @user = guid()
    console.log("Logged in as" + @user)

    @el = document.querySelector(".sendform")
    @el.querySelector(".send").addEventListener("click", => @onClick())
        

  _refresh: ->
    console.log @
    console.log "will now fetch new messages and append them to view"
    $.ajax({
      type: "GET",
      url: "/refresh",
      success:(data) ->
        console.log "Refreshed successfully"
      error:(data) ->
        console.error "Refreshed failed"
        return false
    })
		document.scrollDown()


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

