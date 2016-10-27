import {applyMiddleware} from 'redux';
import PokemonMiddleware from './pokemon_middleware';

export const MasterMiddleware = applyMiddleware(PokemonMiddleware);
