Word = require "./word"

module.exports = class Player
  constructor: (id) ->
    @id    = id
    @x     = Math.floor(Math.random() * 100)
    @y     = Math.floor(Math.random() * 100)
    @words = []

  add_word: (direction, word) ->
    @words.push(new Word(direction, word))

    