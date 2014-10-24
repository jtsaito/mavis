Player = require "./player"

module.exports = class World
  constructor: ->
    @players = []
    
  add_player: (player) ->
    @players.push(player)
