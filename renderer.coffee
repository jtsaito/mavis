window.Renderer = class Renderer
  constructor: (canvas_context) ->
    @ctx = canvas_context
  render: (world) ->
    @ctx.fillStyle = "#000000"
    @ctx.fillRect(0, 0, 800, 600)
    this.render_player(world.p1, "#00ff00")
    this.render_player(world.p2, "#ff00ff")
    @ctx.fillStyle = "#000000"

  render_player: (player, color) ->
    @ctx.fillStyle = color
    @ctx.fillRect(player.x, player.y, 50, 30)
    @ctx.fillStyle = "#000000"

  # {"player":
  #   [ 
  #     { "id":1234,
  #        "x":23,
  #        "y":82,
  #        "words": [
  #             { 
  #               "direction":"left",
  #               "word":"Mouse"
  #             }
  #           ]
  #     }
  #   ]}

#  alert(100)

  #player = "player":
       #"id":1234,
       #"x":23,
       #"y":82,
       #"words": [ { "direction":"left", "word":"Mouse" } ]

  #console.log(player)


#render_words = (player) ->
  #words = (word for word in player.words when foo)
  #console.log words
