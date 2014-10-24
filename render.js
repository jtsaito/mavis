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
