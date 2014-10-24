// Generated by CoffeeScript 1.6.3
(function() {
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
      this.ctx.fillStyle = color;
      return this.ctx.fillRect(player.x, player.y, 30, 30);
    };

    return Renderer;

  })();

}).call(this);
