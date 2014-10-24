var me = "";

var c = document.getElementById("gameCanvas");
var ctx = c.getContext("2d");
var socket = io();
var renderer = new Renderer(ctx);

// Socket
socket.on('world', function(world){
  renderer.render(world);
});

socket.on('setPlayer', function(remotePlayer){
  console.log("remotePlayer: " + remotePlayer);
  console.log("seed: " + seed);

  me = seed === remotePlayer ? 'p1' : 'p2';
  console.log("me: " + me);
  socket.emit('action', { actor: me, action: '23' } );
});

// Canvas

document.addEventListener('keydown', function(e) {
  var action;

  switch(e.keyCode) {
    case 87: action =    'up'; break;
    case 83: action =  'down'; break;
    case 65: action =  'left'; break;
    case 68: action = 'right'; break;
  }

  if(action) {
    socket.emit('action', { actor: me, action: action } );
  }
}, false);
