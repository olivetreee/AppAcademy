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

	const MovingObject = __webpack_require__(1);
	const Util = __webpack_require__(2);
	const Asteroid = __webpack_require__(3);
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
	console.log(ast);
	ast.draw(ctx);
	requestAnimationFrame(animateCallback);
	ast.move();
	ast.draw(ctx);
	// obj.draw(ctx);


/***/ },
/* 1 */
/***/ function(module, exports) {

	function MovingObject(params) {
	  this.pos = params.pos;
	  this.vel = params.vel;
	  this.rad = params.rad;
	  this.color = params.color;
	}

	MovingObject.prototype.draw = function(ctx) {
	  ctx.fillStyle = this.color;
	  ctx.arc(
	    this.pos[0],
	    this.pos[1],
	    this.rad,
	    0,
	    2 * Math.PI
	  );
	  ctx.fill();
	}

	MovingObject.prototype.move = function() {
	  this.pos[0] += this.vel[0];
	  this.pos[1] += this.vel[1];
	}

	module.exports = MovingObject;


/***/ },
/* 2 */
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
	    return [a,b];
	  }
	}


	module.exports = Util;


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__ (2);
	const MovingObject = __webpack_require__ (1);

	function Asteroid(params) {
	  params.color = params.color || "#2c3e50";
	  params.rad = params.rad || 30;
	  params.vel = Util.randomVec(30);
	  MovingObject.call(this, params)
	}

	module.exports = Asteroid;


/***/ }
/******/ ]);