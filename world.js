var me = "";

// Socket
var socket = io();

socket.on('world', function(world){
  render(world);
});

socket.on('setPlayer', function(remotePlayer){
  console.log("remotePlayer: " + remotePlayer);
  console.log("seed: " + seed);

  me = seed === remotePlayer ? 'p1' : 'p2';
  console.log("me: " + me);
  socket.emit('action', { actor: me, action: '23' } );
});

// Canvas
var c = document.getElementById("gameCanvas");
var ctx = c.getContext("2d");

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

function render(world) {
  ctx.fillStyle = "#000000";
  ctx.fillRect(0, 0, 800, 600);
  render_player(world.p1, "#00ff00");
  render_player(world.p2, "#ff00ff");
  ctx.fillStyle = "#000000";
};

function render_player(player, color) {
  ctx.fillStyle = color;
  ctx.fillRect(player.x, player.y, 50, 30);
  ctx.fillStyle = "#000000";
};
