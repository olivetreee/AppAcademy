import React from 'react';
import { withRouter } from 'react-router';


const PokemonIndexItem = ({pokemon, router}) => {

  const handleClick = url => event => router.push(url);

  return (
    <li key={pokemon.id} onClick={handleClick(`/pokemon/${pokemon.id}`)}>
      { pokemon.id }
      <img src = {pokemon.image_url} />
      { pokemon.name }
    </li>
    );
};

export default withRouter(PokemonIndexItem);
