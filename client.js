// Generated by CoffeeScript 1.6.3
(function() {
  var c, ctx, renderer, socket;

  c = document.getElementById("gameCanvas");

  ctx = c.getContext("2d");

  socket = io();

  renderer = new Renderer(ctx);

  window.socket = socket;

  socket.on('world', function(world) {
    return renderer.render(JSON.parse(world));
  });

  window.sendWord = function(word) {
    return socket.emit('action', {
      player: player_id,
      word: {
        direction: 'right',
        word: word
      }
    });
  };

}).call(this);
