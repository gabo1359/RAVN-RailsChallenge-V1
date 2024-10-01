require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  class Validations < ActiveSupport::TestCase
    setup do
      @pokemon = Pokemon.new
    end

    test "is invalid without a name" do
      assert_not @pokemon.valid?
    end

    test "is invalid with an invalid country code" do
      @pokemon.country = "WRONG CODE"
      assert_not @pokemon.valid?
    end

    test "is invalid with an invalid pokemon type" do
      @pokemon.pokemon_type = "invalid type"
      assert_not @pokemon.valid?
    end
  end
end
