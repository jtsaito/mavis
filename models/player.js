// Generated by CoffeeScript 1.8.0
var Player, Word;

Word = require("./word");

module.exports = Player = (function() {
  function Player(id) {
    this.id = id;
    this.x = Math.floor(Math.random() * 50);
    this.y = Math.floor(Math.random() * 50);
    this.words = [];
  }

  Player.prototype.add_word = function(direction, word) {
    return this.words.push(new Word(direction, word));
  };

  return Player;

})();