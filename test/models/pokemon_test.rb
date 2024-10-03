# == Schema Information
#
# Table name: pokemons
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  main_technique :string
#  country        :string
#  pokemon_type   :integer          default("normal"), not null
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  class Validations < PokemonTest
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
