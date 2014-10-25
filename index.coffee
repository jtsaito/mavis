World  = require "./models/world"
Player = require "./models/player"

world = new World

express  = require('express')
app      = express()
http     = require('http').Server(app)
io       = require('socket.io')(http)


# Resources
app.use('/js',     express.static(__dirname + '/public/javascript'))
app.use('/sounds', express.static(__dirname + '/public/sounds'))
app.use('/images', express.static(__dirname + '/public/images'))
app.use(express.static(__dirname + '/public'))

app.get '/', (req, res) ->
  res.sendFile(__dirname + '/public/index.html')


# Run server
http.listen 5555, ->
  console.log('listening on *:5555')


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


# World state
update = (action) ->
  add_word_to_player(action.player_id, action.word) if action.action == 'add_word'

add_player_to_world = (id) ->
  world.add_player(new Player(id))
    
add_word_to_player = (id, word) ->
  player = (world.players.filter (player) -> player.id == id)[0]
  player.add_word(word.direction, word.word)
