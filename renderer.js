// Generated by CoffeeScript 1.8.0
var Renderer;

window.Renderer = Renderer = (function() {
  function Renderer(canvas_context) {
    this.ctx = canvas_context;
  }

  Renderer.prototype.render = function(world) {
    var player, _i, _len, _ref, _results;
    this.ctx.fillStyle = "#000000";
    this.ctx.fillRect(0, 0, 800, 600);
    _ref = world.players;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      player = _ref[_i];
      _results.push(this.render_player(player, "#00ff00"));
    }
    return _results;
  };

  Renderer.prototype.render_player = function(player, color) {
    var coordinates, word, _i, _len, _ref, _results;
    this.ctx.fillStyle = color;
    coordinates = {
      x: player.x,
      y: player.y
    };
    _ref = player.words;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      word = _ref[_i];
      _results.push(coordinates = this.render_word(coordinates, word));
    }
    return _results;
  };

  Renderer.prototype.render_word = function(coordinates, word) {
    var c, _i, _len, _ref;
    switch (word.direction) {
      case 'right':
        _ref = word.word;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          c = _ref[_i];
          this.ctx.fillRect(coordinates.x * 15, coordinates.y * 15, 15, 15);
          coordinates.x = coordinates.x + 1;
        }
        return coordinates;
      case 'left':
        break;
      case 'up':
        break;
      case 'down':
    }
  };

  return Renderer;

})();
