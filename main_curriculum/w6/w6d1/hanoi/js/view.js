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
