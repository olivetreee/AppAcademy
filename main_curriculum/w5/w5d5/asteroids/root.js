const GameView = require('./lib/game_view.js');
const Game = require('./lib/game.js');
const MovingObject = require('./lib/moving_object.js');
const Asteroid = require('./lib/asteroid.js');
const Util = require('./lib/util.js');


Util.inherits(Asteroid, MovingObject);

gv = new GameView;

gv.start();
