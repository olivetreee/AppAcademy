const Board = require ('./board');

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {

  constructor() {
    this.board = new Board;
    console.log(this.board);
    this.currentMark = "o";
  }

  run() {
    console.log(this.board.grid);
    if (this.board.won(this.currentMark)) {
      console.log(`${this.currentMark} won!`)
      reader.close();
    } else {
      this.switchPlayer();
      this.promptMove((x, y) => {
        this.board.placeMark([x, y], this.currentMark);
        this.run();
      })
    }
  }



  promptMove(callback) {
    console.log(`${this.currentMark.toUpperCase()}'s turn`);
    reader.question("Select a position \r\n > ", (moves) => {
      moves = moves.split(",").map(val => Number(val));
      let x = moves[0] - 1;
      let y = moves[1] - 1;
      callback(x, y);
    })
  }

  switchPlayer() {
    this.currentMark = this.currentMark === 'x' ? 'o' : 'x';
  }
}

let game = new Game;
game.run();
