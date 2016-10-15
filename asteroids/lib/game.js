const Asteroid = require('./asteroid.js');

function Game(dim_x, dim_y, num_asteroids) {
  this.DIM_X = dim_x;
  this.DIM_Y = dim_y;
  this.NUM_ASTEROIDS = num_asteroids;
  this.asteroids = [];
}

Game.prototype.addAsteroids = function() {
  while (this.asteroids.length != this.NUM_ASTEROIDS) {
    pos = this.randomPosition();
    this.asteroids.push(new Asteroid({pos: pos}))
  }
}

Game.prototype.randomPosition = function() {
  x = Math.random() * this.DIM_X;
  y = Math.random() * this.DIM_Y;
  return [Math.floor(x),Math.floor(y)]
}

Game.prototype.draw = function(ctx){
  ctx.clearRect;
  this.asteroids.forEach((ast) => ast.draw(ctx));
  console.log(this.asteroids);
  this.moveObjects();
  console.log(this.asteroids);
}

Game.prototype.moveObjects = function() {
  this.asteroids.forEach( (ast) => {
    console.log("ASTEROID:");
    console.log(ast);
    ast.move();
    console.log(ast);
  });
}
module.exports = Game;
