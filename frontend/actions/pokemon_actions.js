export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const REQUEST_ALL_POKEMON = "REQUEST_ALL_POKEMON";

export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON";
export const REQUEST_ONE_POKEMON = "REQUEST_ONE_POKEMON";

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const requestAllPokemon = () => ({
  type: REQUEST_ALL_POKEMON,
});

export const receiveOnePokemon = (pokemon) => ({
  type: RECEIVE_ONE_POKEMON,
  pokemon
});

export const requestOnePokemon = () => ({
  type: REQUEST_ONE_POKEMON
});
