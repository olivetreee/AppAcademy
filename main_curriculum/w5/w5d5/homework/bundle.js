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

	let Animals = __webpack_require__(1);
	let Dog = __webpack_require__ (2);
	let Cat = __webpack_require__ (3);

	let d = new Dog("Corgie");
	d.woof();

	let c = new Cat("HP");
	console.log(c.name);
	c.meow();

	d.eat();
	c.eat();


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Animals {
	  constructor(name) {
	    this.name = name;
	  }

	  eat() {
	    console.log("hmm... food")
	  }
	}

	module.exports = Animals;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	let Animals = __webpack_require__(1);

	class Dog extends Animals {

	  constructor(name) {
	    super(name);
	    this.tail = 10;
	  }

	  woof() {
	    console.log("woof woof")
	  }
	}

	module.exports = Dog;


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	let Animals = __webpack_require__(1);

	class Cat extends Animals {

	  constructor(name) {
	    super(name);
	    this.tail = 7;
	  }

	  meow() {
	    console.log("meow meow")
	  }
	}

	module.exports = Cat;


/***/ }
/******/ ]);