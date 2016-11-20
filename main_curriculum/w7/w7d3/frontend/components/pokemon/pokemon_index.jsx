import React from 'react';
import PokemonIndexItem from './pokemon_index_item.jsx';

export const PokemonIndex = ({pokemon}) => (
  <div>
    <ul className = "pokemon-list">
      {
        pokemon.map( pkmn => (
          <PokemonIndexItem key={pkmn.id} pokemon={pkmn}/>
        ))
      }
    </ul>
  </div>
);
