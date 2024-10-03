# == Schema Information
#
# Table name: catches
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  pokemon_id :integer          not null
#  alias      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CatchTest < ActiveSupport::TestCase
  class Validations < CatchTest
    setup do
      @catch = Catch.new
      @catch.pokemon = pokemons(:pikachu)
      @catch.user = users(:ash)
    end

    test "is invalid without a pokemon" do
      @catch.pokemon = nil
      assert_not @catch.valid?
    end


    test "is invalid without a user" do
      @catch.user = nil
      assert_not @catch.valid?
    end
  end
end
