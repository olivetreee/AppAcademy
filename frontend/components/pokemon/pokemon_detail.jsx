import React from 'react';

export const PokemonDetail = ({pokemon}) => (
  <div>
    <img src={pokemon.image_url}/>
    <h2>{pokemon.name}</h2>
    <p>Type: {pokemon.poke_type}</p>
    <p>Attack: {pokemon.attack}</p>
    <p>Defense: {pokemon.defense}</p>
    <p>Moves: {pokemon.moves}</p>
  </div>
);

STOPPED HERE:
PHASE 5: Add a Route that renders the PokemonDetailContainer component when the url matches the path "pokemon/:pokemonId".
