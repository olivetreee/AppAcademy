const Game = require('./game.js');

function GameView() {

};

GameView.prototype.start = function() {
  const canvasEl = document.getElementsByTagName("canvas")[0];
  canvasEl.height = window.innerHeight;
  canvasEl.width = window.innerWidth;

  ctx = canvasEl.getContext("2d");

  setInterval(() => {
    g = new Game(300, 300, 1);
    g.draw(ctx);
    g.moveObjects();
    // console.log("Asteroid")
  }, 20);
}


module.exports = GameView;
