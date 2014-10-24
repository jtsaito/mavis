window.Renderer = class Renderer
  constructor: (canvas_context) ->
    @ctx = canvas_context
  
  render: (world) ->
    @ctx.fillStyle = "#000000"
    @ctx.font      = "15px Helvetica"
    @ctx.fillRect(0, 0, 800, 600)
    
    this.render_goal(world.goal)

    for player in world.players
      this.render_player(player, world.goal)


  render_goal: (goal) ->
    @ctx.fillStyle = "#00FF00"
    @ctx.fillRect(goal.x * 15, goal.y * 15, 15, 15)

    img = document.getElementById("babbel")
    @ctx.drawImage(img, goal.x * 15, goal.y * 15, 15, 15)


  render_player: (player, goal) ->
    @ctx.fillStyle = player.color
    
    coordinates = 
      x: player.x
      y: player.y

    for word, index in player.words
      coordinates = this.render_word(coordinates, word, goal)

  render_word: (coordinates, word, goal) ->
    direction = word.direction

    for char, index in word.word
      this.render_character(char, coordinates.x, coordinates.y)
      if index != word.word.length - 1
        switch direction
          when 'right'
            coordinates.x = coordinates.x + 1
          when 'left'
            coordinates.x = coordinates.x - 1
          when 'up'
            coordinates.y = coordinates.y - 1
          when 'down'
            coordinates.y = coordinates.y + 1

      this.player_won() if coordinates.x == goal.x and coordinates.y == (goal.y + 1)

    return coordinates

  render_character: (char, x, y) ->
    @ctx.fillText(char.toUpperCase(), x * 15, y * 15, 15, 15)

  word_check: (word) ->
    $.inArray(word, window.words_eng) >= 0

  player_won: ->
    sound = new Howl({ urls: ['win.mp3'], volume: 1.5 }).play()
