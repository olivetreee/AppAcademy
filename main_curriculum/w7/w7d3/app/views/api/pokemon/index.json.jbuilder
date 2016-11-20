@pokemon.each do |pkmn|
  json.set! pkmn.id do |id|
    json.extract! pkmn, :id, :name, :image_url
  end
end
