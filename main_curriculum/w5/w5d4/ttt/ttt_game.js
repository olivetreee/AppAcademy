class Board {

  constructor(){
    this.grid = new Array(3);
    for (let i = 0; i < 3; i++) {
      this.grid[i] = new Array('', '','');
    };
  }

  placeMark(pos, mark){
    let x = pos[0] - 1;
    let y = pos[1] - 1;
    this.grid[x][y] = mark;
  }

  won(mark) {
    return (this.wonRow(mark) || this.wonCol(mark) || this.wonDiag(mark)) ? true : false;
  }

  wonRow(mark){
    for (let i = 0; i < 3; i++) {
      if (this.grid[i].every((letter) => letter === mark)) return true;
    };
    return false
  }

  wonCol(mark) {
    for (let i = 0; i < 3; i++) {
      let col = [];
      for (let j = 0; j < 3; j++) {
        col.push(this.grid[j][i]);
      }
      if (col.every((letter) => letter === mark)) return true;
    };
    return false
  }

  wonDiag(mark) {
    let diag1 = [this.grid[0][0], this.grid[1][1], this.grid[2][2]]
    if (diag1.every((letter) => letter === mark)) return true;

    let diag2 = [this.grid[0][2], this.grid[1][1], this.grid[2][0]]
    if (diag2.every((letter) => letter === mark)) return true;

    return false;
  }
}

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

  // promptMove(callback) {
  //   console.log(`${this.currentMark.toUpperCase()}'s turn`);
  //   reader.question("Select a position \r\n > ", (moves) => {
  //     moves = moves.split(",").map(val => Number(val));
  //     let x = moves[0] - 1;
  //     let y = moves[1] - 1;
  //     callback(x, y);
  //   })
  //
  // }

  switchPlayer() {
    this.currentMark = this.currentMark === 'x' ? 'o' : 'x';
  }
}

$(function() {
  let board = new Board;
  let currentMark = 'x';
  $('.square').on('click', function(e){
    let square = e.target;
    let pos = $(square).data('pos');
    board.placeMark(pos, 'x');
    square.innerHTML = currentMark;
    if (board.won(currentMark)) { alert("Winner") };
    currentMark = currentMark === 'x' ? 'o' : 'x';
  })

});
