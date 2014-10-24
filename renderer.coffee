window.Renderer = class Renderer
  constructor: (canvas_context) ->
    @ctx = canvas_context
  
  render: (world) ->
    @ctx.fillStyle = "#000000"
    @ctx.font      = "15px Helvetica"
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
    direction = word.direction

    for char in word.word
      this.render_character(char, coordinates.x, coordinates.y)
      switch direction
        when 'right'
          coordinates.x = coordinates.x + 1
        when 'left'
          coordinates.x = coordinates.x - 1
        when 'up'
          coordinates.y = coordinates.y - 1
        when 'down'
          coordinates.y = coordinates.y + 1

    return coordinates

  render_character: (char, x, y) ->
    @ctx.fillText(char.toUpperCase(), x * 15, y * 15, 15, 15)
