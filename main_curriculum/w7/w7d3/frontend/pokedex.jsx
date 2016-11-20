import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';

import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions';
import {fetchAllPokemon} from './util/api_util';

import configureStore from './store/store';
import {selectAllPokemon} from './reducers/selectors';

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const rootEl = document.getElementById("root");
  ReactDOM.render(<Root store={store}/>, rootEl);

  // store.dispatch(requestAllPokemon());

});
