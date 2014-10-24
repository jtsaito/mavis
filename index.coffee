World  = require "./models/world"
Player = require "./models/player"

world = new World

app  = require('express')()
http = require('http').Server(app)
io   = require('socket.io')(http)

# Resources
app.get '/', (req, res) ->
  res.sendFile(__dirname + '/index.html')

app.get '/world.js', (req, res) ->
  res.sendFile(__dirname + '/world.js')

app.get '/renderer.js', (req, res) ->
  res.sendFile(__dirname + '/renderer.js')

app.get '/jquery-1.11.1.min.js', (req, res) ->
  res.sendFile(__dirname + '/jquery-1.11.1.min.js')


# App and sockets
io.on 'connection', (socket) ->

  # Handle actions
  socket.on 'action', (action) ->
    if action
      update action
      io.emit('world', JSON.stringify(world))

  # Initialize new player
  socket.on 'setPlayer', (msg) ->
    io.emit('setPlayer', msg)

# Run server
http.listen 3000, ->
  console.log('listening on *:3000')

update = (action) ->
  switch action.action
    when 'add_word' then add_word_to_player(action.id, action.word)
    
add_word_to_player = (id, word) ->
  player = world.players.filter (player) -> player.id == id
  player.add_word(word.direction, word.word)
