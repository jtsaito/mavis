window.Renderer = class Renderer
  constructor: (canvas_context) ->
    @ctx = canvas_context
  
  render: (world) ->
    @ctx.fillStyle = "#000000"
    @ctx.fillRect(0, 0, 800, 600)
    
    for player in world.players
      this.render_player(player, "#00ff00")

  render_player: (player, color) ->
    @ctx.fillStyle = color
    
    coordinates = 
      x: player.x
      y: player.y

    for word in player.words
      coordinates = this.render_word(coordinates, word)

  render_word: (coordinates, word) ->
    switch word.direction
      when 'right'
        for c in word.word
          @ctx.fillRect(coordinates.x * 15, coordinates.y * 15, 15, 15)
          coordinates.x = coordinates.x + 1
        return coordinates
      when 'left'  then
      when 'up'    then
      when 'down'  then
