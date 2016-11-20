import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions';
import merge from 'lodash/merge';



export const PokemonReducer = (state={}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return  merge({}, action.pokemon);
    default:
      return state;
  }
};
