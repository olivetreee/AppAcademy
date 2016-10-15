/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(1);
	const MovingObject = __webpack_require__(4);
	const Asteroid = __webpack_require__(2);
	const Util = __webpack_require__(3);
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


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const Asteroid = __webpack_require__(2);

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


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__ (3);
	const MovingObject = __webpack_require__ (4);

	function Asteroid(params) {
	  params.color = params.color || "#2c3e50";
	  params.rad = params.rad || 30;
	  params.vel = Util.randomVec(30);
	  MovingObject.call(this, params)
	}

	module.exports = Asteroid;


/***/ },
/* 3 */
/***/ function(module, exports) {

	const Util = {
	  inherits (childClass, parentClass) {
	    const Surrogate = function() {};
	    Surrogate.prototype = parentClass.prototype;
	    childClass.prototype = new Surrogate;
	    childClass.prototype.constructor = childClass;
	  },
	  randomVec(length) {
	    a = Math.random() * length;
	    b = Math.pow(Math.pow(length,2) - Math.pow(a,2), 0.5);

	    multiplyer = (Math.random() < 0.5) ? -1 : 1;
	    a *= multiplyer

	    multiplyer = (Math.random() < 0.5) ? -1 : 1;
	    b *= multiplyer

	    return [a,b];
	  }
	}


	module.exports = Util;


/***/ },
/* 4 */
/***/ function(module, exports) {

	function MovingObject(params) {
	  this.pos = params.pos;
	  this.vel = params.vel;
	  this.rad = params.rad;
	  this.color = params.color;
	}

	MovingObject.prototype.draw = function(ctx) {
	  ctx.fillStyle = this.color;
	  ctx.beginPath();
	  ctx.arc(
	    this.pos[0],
	    this.pos[1],
	    this.rad,
	    0,
	    2 * Math.PI,
	    false
	  );
	  ctx.fill();
	}

	MovingObject.prototype.move = function() {
	  this.pos[0] += this.vel[0];
	  this.pos[1] += this.vel[1];
	}

	module.exports = MovingObject;


/***/ }
/******/ ]);