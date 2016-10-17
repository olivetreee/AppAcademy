const View = require ('./ttt-view');
const Game = require ('./game');

$( () => {
  game = new Game();
  $tttTarget = $(".ttt");
  view = new View(game, $tttTarget);
  view.bindEvents();
});
