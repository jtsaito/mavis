world = { "p1": { x: 200, y: 200}, "p2": { x: 200, y: 400} }

app  = require('express')()
http = require('http').Server(app)
io   = require('socket.io')(http)


# Files
app.get '/', (req, res) ->
  res.sendFile(__dirname + '/index.html')

app.get '/world.js', (req, res) ->
  res.sendFile(__dirname + '/world.js')

app.get '/jquery-1.11.1.min.js', (req, res) ->
  res.sendFile(__dirname + '/jquery-1.11.1.min.js')


# App and sockets
io.on 'connection', (socket) ->

  socket.on 'action', (action) ->
    if(action)
      update(action);
      io.emit('world', world)

  socket.on 'setPlayer', (msg) ->
    io.emit('setPlayer', msg)



http.listen 3000, ->
  console.log('listening on *:3000')


# world
update = (action) ->
  actor = action.actor

  switch action.action
    when 'up'    then world[actor].y = world[actor].y - 10
    when 'down'  then world[actor].y = world[actor].y + 10
    when 'left'  then world[actor].x = world[actor].x - 10
    when 'right' then world[actor].x = world[actor].x + 10
