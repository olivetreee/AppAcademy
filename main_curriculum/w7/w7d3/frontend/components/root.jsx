import React from 'react';
import {Provider} from 'react-redux';
import {Router, Route, hashHistory} from 'react-router';

import PokemonIndexContainer from './pokemon/pokemon_index_container';
import {requestAllPokemon} from '../actions/pokemon_actions';


const Root = ({ store }) => {
  const requestOnEnter = () => store.dispatch(requestAllPokemon());
  return (
  <Provider store={store}>
    <Router history={hashHistory}>
      <Route path="/" component={PokemonIndexContainer} onEnter={requestOnEnter}/>
    </Router>
  </Provider>
  );
};

export default Root;
