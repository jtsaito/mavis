Word = require "./word"

module.exports = class Player
  constructor: (id) ->
    @id    = id
    @x     = Math.floor(Math.random() * 45)
    @y     = Math.floor(Math.random() * 45)
    @words = []
    @color = '#' + Math.floor(Math.random() * 16777215).toString(16)

  add_word: (direction, word) ->
    @words.push(new Word(direction, word))

    
