class Board {

  constructor(){
    this.grid = new Array(3);
    for (let i = 0; i < 3; i++) {
      this.grid[i] = new Array('', '','');
    };
  }

  placeMark(pos, mark){
    let x = pos[0];
    let y = pos[1];
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

module.exports = Board;
