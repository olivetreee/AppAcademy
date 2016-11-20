import {RECEIVE_ONE_POKEMON} from '../actions/pokemon_actions';
import merge from 'lodash/merge';


export const  PokemonDetailReducer = (state={}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ONE_POKEMON:
      let newState = merge({}, state);
      newState = action.pokemon;
      return newState;
    default:
      return state;
  }
};
