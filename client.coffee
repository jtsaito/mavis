c        = document.getElementById("gameCanvas")
ctx      = c.getContext("2d")
socket   = io()
renderer = new Renderer(ctx)

window.socket = socket

# Socket
socket.on 'world', (world) ->
  renderer.render JSON.parse(world)

window.sendWord = (word) ->
  socket.emit 'action', { player: player_id, word: { direction: 'right', word: word } }
