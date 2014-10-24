var c         = document.getElementById("gameCanvas");
var ctx       = c.getContext("2d");
var socket    = io();
var renderer  = new Renderer(ctx);

// Socket
socket.on('world', function(world) {
  renderer.render(JSON.parse(world));
});
