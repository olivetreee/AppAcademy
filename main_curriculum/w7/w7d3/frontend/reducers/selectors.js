import values from 'lodash/values';

export const selectAllPokemon = (state) => {
  return values(state.pokemon);
};
