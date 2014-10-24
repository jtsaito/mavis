Player = require "./player"
Goal   = require "./goal"

module.exports = class World
  constructor: ->
    @players = []
    @goal    = new Goal
    
  add_player: (player) ->
    @players.push(player)
