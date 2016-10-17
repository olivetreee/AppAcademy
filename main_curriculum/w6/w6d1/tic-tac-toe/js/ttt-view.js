class View {
  constructor(game, $el) {
    this.$el = $el;
    $el.append(this.setupBoard());
  }

  bindEvents() {
    $("li").on("click", (event) => {
      let $clickedCell = $(event.currentTarget);
      this.makeMove($clickedCell);
      $clickedCell.off("click");
      $clickedCell.unbind('mouseenter').unbind('mouseleave');
      $clickedCell.removeClass("empty");
    })

    const mouseEnter = function(event) {
      let $hoveredCell = $(event.currentTarget);
      $hoveredCell.text(game.currentPlayer);
    }

    const mouseLeave = function(event) {
      let $hoveredCell = $(event.currentTarget);
      $hoveredCell.text("");
    }

    $("li").hover(mouseEnter, mouseLeave);
  }

  gameOver(currentPlayer) {
    let $winnerLabel = $("<h2></h2>");
    $winnerLabel.text(currentPlayer);
    $(".winner-hover").append($winnerLabel);
    $(".winner-hover").append("<p>WINS</p>");

    let winnerClass = `${currentPlayer}-won`;
    $(".winner-hover").addClass(winnerClass);
    $(".winner-hover").attr("style", "display: block")

    //THIS IS SO SLOW! Figure out why speed is slow.
    $(".winner-hover").animate({
      opacity: 1
    }, 100);

    $("li").off("click");
    $("li").unbind('mouseenter').unbind('mouseleave');
    $("li").removeClass("empty");
  }

  makeMove($square) {
    let pos = $square.data("pos");

    const currentPlayer = game.currentPlayer;
    $square.text(currentPlayer);
    $square.addClass(currentPlayer);

    /*The move has to be made after I place it on the screen.
    If not, the virtual Board will start with X, then Game switches
    players, so the opposite player will then be marked on the screen.
    */
    game.playMove(pos);

    if (game.isOver()) {
      this.gameOver(currentPlayer);
    }

  }

  setupBoard() {
    const $row = $("<ul></ul>");
    for (let col=0; col<9; col++) {
      let $cell = $("<li class=\"empty\"></li>");
      let x = Math.floor(col/3);
      let y = Math.floor(col%3);
      $cell.data("pos", [x,y]);
      $row.append($cell);
    }
    return $row;
  }
}

module.exports = View;
