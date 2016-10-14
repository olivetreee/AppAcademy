const MovingObject = require('./lib/moving_object.js');
const Util = require('./lib/util.js');
const Asteroid = require('./lib/asteroid.js');
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
// obj.draw(ctx);
