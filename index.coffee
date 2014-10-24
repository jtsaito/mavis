World  = require "./models/world"
Player = require "./models/player"

world = new World

app  = require('express')()
http = require('http').Server(app)
io   = require('socket.io')(http)

# Resources
app.get '/', (req, res) ->
  res.sendFile(__dirname + '/index.html')

app.get '/client.js', (req, res) ->
  res.sendFile(__dirname + '/client.js')

app.get '/renderer.js', (req, res) ->
  res.sendFile(__dirname + '/renderer.js')

app.get '/wordlists.js', (req, res) ->
  res.sendFile(__dirname + '/wordlists.js')

app.get '/jquery-1.11.1.min.js', (req, res) ->
  res.sendFile(__dirname + '/jquery-1.11.1.min.js')

app.get '/babbel.png', (req, res) ->
  res.sendFile(__dirname + '/babbel.png')

app.get '/howler.min.js', (req, res) ->
  res.sendFile(__dirname + '/howler.min.js')

app.get '/fail.mp3', (req, res) ->
  res.sendFile(__dirname + '/sounds/fail.mp3')

app.get '/enter.mp3', (req, res) ->
  res.sendFile(__dirname + '/sounds/enter.mp3')

app.get '/win.mp3', (req, res) ->
  res.sendFile(__dirname + '/sounds/win.mp3')

# App and sockets
io.on 'connection', (socket) ->

  # Handle actions
  socket.on 'action', (action) ->
    if action
      update action
      io.emit('world', JSON.stringify(world))

  # Initialize new player
  socket.on 'setPlayer', (id) ->
    add_player_to_world id
    console.log JSON.stringify(world)
    io.emit('world', JSON.stringify(world))

# Run server
http.listen 5555, ->
  console.log('listening on *:5555')

update = (action) ->
  switch action.action
    when 'add_word' then add_word_to_player(action.player_id, action.word)

add_player_to_world = (id) ->
  world.add_player(new Player(id))
    
add_word_to_player = (id, word) ->
  player = (world.players.filter (player) -> player.id == id)[0]
  player.add_word(word.direction, word.word)
