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

	const HanoiGame = __webpack_require__(1);
	const HanoiView = __webpack_require__(2);

	$( () => {
	  const rootEl = $('.hanoi');
	  const game = new HanoiGame();
	  view = new HanoiView(game, rootEl);
	  view.bindEvents();

	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length == 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx)
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ },
/* 2 */
/***/ function(module, exports) {

	class View {
	  constructor(game, $el) {
	    this.game = game;
	    this.setupTowers();
	    this.render();
	    this.$fromTower = undefined;
	    this.$toTower = undefined;
	  }

	  //This method is so we can select the number of disks we want to play with. To do that, we'll need more disk classes. This feature is not yet implemented.
	  diskHeight() {
	    let numOfDisks = this.game.towers[0][0];
	    let totalHeight = 300;
	    return Math.floor(totalHeight/numOfDisks);
	  }

	  setupTowers() {
	    let heightOfDisks = this.diskHeight();
	    for (let tower=0; tower<3; tower++) {
	      let $towersBase = $("<ul></ul>");
	      $towersBase.data("tower", tower);

	      for (let i=0; i<3; i++) {
	        let $base = $("<li></li>");
	        $base.css("height", heightOfDisks);
	        $towersBase.append($base);
	      }
	      $(".towers").append($towersBase);
	    }
	  }


	  render() {
	    let towers = this.game.towers; //All virtual towers
	    let $screenTowers = $("ul"); //All screen towers
	    let towerIdx = 0;

	    towers.forEach((tower) => { //For each virtual tower...
	      let $screenTower = $($screenTowers[towerIdx]); //... get the corresponding screen tower (ul)
	      let diskIdx = 0;
	      tower.forEach((disk) => { //For each virtual disk...
	        let virtualTowerLength = $screenTower.children().length;
	        // let $screenDisk = $($screenTower.children()[disk-1]); //... get the corresponding screen disk (li)
	        let $screenDisk = $($screenTower.children()[virtualTowerLength - 1 - diskIdx]); //... get the corresponding screen disk (li)
	        let diskClass = `disk${disk}`;
	        $screenDisk.removeClass().addClass(diskClass); //Remove whatever class we had and add the corresponding disk class.
	        diskIdx++;
	      })
	      towerIdx++;
	    })
	  }

	  performScreenMove() {
	    let fromTowerIdx = this.$fromTower.data("tower");
	    let toTowerIdx = this.$toTower.data("tower");

	    let fromVirtualTower = this.game.towers[fromTowerIdx];

	    // let virtualDiskToMove = fromVirtualTower[fromVirtualTower.length-1];
	    // let $diskToMove = $(this.$fromTower.children()[virtualDiskToMove-1]);

	    let virtualDiskToMoveIdx = fromVirtualTower.length-1;

	    let diskToMoveIdx = this.$fromTower.children().length - 1 - virtualDiskToMoveIdx; //If my virtual tower has 3 disks and I'm moving one from it, I want to move the first li from my screen tower.

	    let $diskToMove = $(this.$fromTower.children()[diskToMoveIdx]);

	    this.game.move(fromTowerIdx, toTowerIdx);

	    $diskToMove.removeClass();
	  }

	  bindEvents() {
	    $("ul").on("click", (event) => {
	      // console.log(this.game.towers);
	      if (this.$fromTower === undefined) {
	        this.$fromTower = $(event.currentTarget);
	      } else {
	        this.$toTower = $(event.currentTarget);
	      }


	      if (this.$fromTower !== undefined && this.$toTower !== undefined) {
	        this.performScreenMove();

	        //Resetting clicks
	        this.$fromTower = undefined;
	        this.$toTower = undefined;

	        this.render();
	      }

	      if (this.game.isWon()) {
	        console.log("Won!");
	      }

	    })
	  }



	}

	module.exports = View;


/***/ }
/******/ ]);