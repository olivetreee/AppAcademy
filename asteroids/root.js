const Game = require('./lib/game.js');
const MovingObject = require('./lib/moving_object.js');
const Asteroid = require('./lib/asteroid.js');
const Util = require('./lib/util.js');
const canvasEl = document.getElementsByTagName("canvas")[0];
canvasEl.height = window.innerHeight;
canvasEl.width = window.innerWidth;
// new Game(
//   canvasEl.width,
//   canvasEl.height
// ).start(canvasEl);

Util.inherits(Asteroid, MovingObject);
obj = new MovingObject({ pos: [30, 30], vel: [10, 10], rad: 5, color: "#00FF00"});
const ctx = canvasEl.getContext("2d");
ast = new Asteroid({pos: [50,50]});
// ast.draw(ctx);
// ast.move();
// ast.draw(ctx);
g = new Game(300, 300, 3);

g.addAsteroids();
// console.log(g.asteroids[0].pos);
console.log(g.asteroids);
g.moveObjects();
console.log(g.asteroids);
// console.log(g.asteroids[0].pos[0], g.asteroids[0].vel[0]);
// g.asteroids[0].move();
// console.log(g.asteroids);

// console.log(asteroids);
// setInterval(g.draw(ctx), 100);
// ast.draw(ctx);
// ast.move();
// ast.draw(ctx);
// obj.draw(ctx);
