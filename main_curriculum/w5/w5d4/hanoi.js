const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class HanoiGame {

  constructor() {
    this.towers = [[3,2,1],[],[]];
  }

  promptMove(callback) {
    reader.question("Select a from, to towers \r\n > ", (moves) => {
      moves = this.parseMoves(moves);
      let fromTower = moves[0] - 1;
      let endTower = moves[1] - 1;
      callback(fromTower, endTower);
    })
  }

  parseMoves(moves) {
    return moves.split(",").map(val => Number(val));
  }

  isValidMove(start, end) {
    let startTower = this.towers[start];
    let endTower = this.towers[end];
    if (endTower.length === 0){
      return true;
    } else if (endTower[endTower.length-1] > startTower[startTower.length-1]) {
      return true;
    } else {
      return false;
    }
  }

  move (start,end) {
    if (this.isValidMove(start, end)) {
      this.towers[end].push(this.towers[start].pop());
      return true;
    } else {
      return false;
    }
  }

  print() {
    for (let i = 2; i >= 0; i--){
      let first = (this.towers[0][i] === undefined) ? " " : this.towers[0][i];
      let second = (this.towers[1][i] === undefined) ? " " : this.towers[1][i];
      let third = (this.towers[2][i] === undefined) ? " " : this.towers[2][i];
      console.log(`${first} | ${second} | ${third}`);
    }
    // console.log(JSON.stringify(this.towers));
    console.log("---------");
    console.log("1 | 2 | 3");
  }

  isWon() {
    if (this.towers[0].length === 0 && this.towers[1].length === 0) return true;
    return false;
  }

  run() {
    /* In jaRuby
    Initialize towers;
    until gameOver {
    Display the towers;
    Prompt user for move (tower_from, tower_to);
    Validate move;
    Make move;
  }
  */
    this.print();
    promptMove( function() {
      // sdfsodf
    })
    this.promptMove((start,end) => {
      if (this.move(start,end) === false) {
        console.log("Invalid move");
      }
      if (this.isWon()){
        console.log("You win!!!!!!");
        this.print();
        reader.close();
      } else {
        this.run();
      }
    });
  }
}

hanoi = new HanoiGame();
hanoi.run();
