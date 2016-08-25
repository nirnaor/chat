# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
guid = ->
  s4 = ->
    Math.floor((1 + Math.random()) * 0x10000).toString(16).substring 1
  s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4()

class ChatView
  constructor: ->
    id = guid()
    console.log("Logged in as" + id)

    @el = document.querySelector(".sendform")
    @el.querySelector(".send").addEventListener("click", => @onClick())

   onClick: ->
     message = @el.querySelector(".newmessage").value
     console.log message



window.addEventListener("DOMContentLoaded", -> new ChatView())

