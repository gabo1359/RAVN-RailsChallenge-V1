module PokemonsHelper
  BADGE_CLASSES = {
    normal:   "bg-gray-100 text-gray-800",
    fighting: "bg-red-200 text-red-800",
    flying:   "bg-indigo-100 text-indigo-700",
    poison:   "bg-purple-100 text-purple-700",
    ground:   "bg-yellow-200 text-yellow-800",
    rock:     "bg-yellow-100 text-yellow-800",
    bug:      "bg-green-50 text-green-600",
    ghost:    "bg-indigo-100 text-indigo-700",
    steel:    "bg-gray-100 text-gray-700",
    fire:     "bg-red-100 text-red-700",
    water:    "bg-blue-100 text-blue-700",
    grass:    "bg-green-100 text-green-700",
    electric: "bg-yellow-100 text-yellow-700",
    psychic:  "bg-pink-100 text-pink-700",
    ice:      "bg-blue-50 text-blue-600",
    dragon:   "bg-indigo-200 text-indigo-800",
    dark:     "bg-gray-200 text-gray-900",
    fairy:    "bg-pink-50 text-pink-600",
    stellar:  "bg-teal-100 text-teal-700",
    unknown:  "bg-gray-100 text-gray-900"
  }

  def badge_classes_for(pokemon_type)
    BADGE_CLASSES[pokemon_type.to_sym] || BADGE_CLASSES[:unknown]
  end

  def pokemon_types_for_select
    Pokemon.pokemon_types.keys.map { |type| [type.capitalize, type] }
  end

  def total_pokemons
    Pokemon.count
  end
end
