import {combineReducers} from 'redux';
import {PokemonReducer} from './pokemon_reducer';
import {PokemonDetailReducer} from './pokemon_detail_reducer';

const RootReducer = combineReducers({
  pokemon: PokemonReducer,
  pokemonDetail: PokemonDetailReducer
});

export default RootReducer;
