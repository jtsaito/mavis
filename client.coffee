c        = document.getElementById("gameCanvas")
ctx      = c.getContext("2d")
socket   = io()
renderer = new Renderer(ctx)

window.socket = socket

# Socket
socket.on 'world', (world) ->
  console.log world
  renderer.render JSON.parse(world)

window.sendWord = (word) ->
  socket.emit 'action', { action: 'add_word', player_id: player_id, word: { direction: direction, word: word } }
