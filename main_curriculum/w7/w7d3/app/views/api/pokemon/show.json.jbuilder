json.extract! @pokemon,
  :id,
  :name,
  :attack,
  :defense,
  :image_url,
  :moves,
  :poke_type
  # :items
  #
  json.set! :items do |item|
    json.array! @pokemon.items,
    :id,
    :name,
    :pokemon_id,
    :price,
    :happiness,
    :image_url
  end
