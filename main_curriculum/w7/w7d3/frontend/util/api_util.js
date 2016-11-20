export const fetchAllPokemon = (success) => {
  $.ajax ({
    method: 'GET',
    url: "api/pokemon",
    success
  });
};


export const fetchOnePokemon = (success, id) => {
  $.ajax ({
    method: 'GET',
    url: `api/pokemon/${id}`,
    success
  });
};
