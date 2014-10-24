// Generated by CoffeeScript 1.8.0
var c, ctx, renderer, socket;

c = document.getElementById("gameCanvas");

ctx = c.getContext("2d");

socket = io();

renderer = new Renderer(ctx);

window.socket = socket;

socket.on('world', function(world) {
  console.log(world);
  return renderer.render(JSON.parse(world));
});

window.sendWord = function(word) {
  return socket.emit('action', {
    action: 'add_word',
    player_id: player_id,
    word: {
      direction: 'right',
      word: word
    }
  });
};
