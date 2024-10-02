require "test_helper"

class PokemonsHelperTest < ActionView::TestCase
  setup do
    @pikachu = pokemons(:pikachu)
    @squirtle = pokemons(:squirtle)
    @bulbasaur = pokemons(:bulbasaur)
    @charmander = pokemons(:charmander)
  end

  test "#badge_classes_for" do
    assert_equal "bg-yellow-100 text-yellow-700", badge_classes_for(@pikachu.pokemon_type)
    assert_equal "bg-blue-100 text-blue-700", badge_classes_for(@squirtle.pokemon_type)
    assert_equal "bg-green-100 text-green-700", badge_classes_for(@bulbasaur.pokemon_type)
    assert_equal "bg-red-100 text-red-700", badge_classes_for(@charmander.pokemon_type)
  end
end
