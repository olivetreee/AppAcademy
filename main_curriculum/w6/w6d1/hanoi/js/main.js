const HanoiGame = require('./game');
const HanoiView = require('./view');

$( () => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  view = new HanoiView(game, rootEl);
  view.bindEvents();

});
