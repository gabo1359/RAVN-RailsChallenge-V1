require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  class Admin < PokemonsControllerTest
    setup do
      @pikachu = pokemons(:pikachu)
      @admin = users(:admin)

      sign_in @admin
    end

    test "#index" do
      get pokemons_url
      assert_response :success
    end

    test "#new" do
      get new_pokemon_url
      assert_response :success
    end

    test "#create with success" do
      assert_difference("Pokemon.count") do
        post pokemons_url, params: { pokemon: { name: "Ditto", pokemon_type: "normal" } }
      end
      assert_redirected_to pokemons_url
      assert_equal flash[:success], I18n.t("pokemons.create_success")
    end

    test "#create with failure" do
      assert_no_difference("Pokemon.count") do
        post pokemons_url, params: { pokemon: { name: "", pokemon_type: "normal" } }
      end
      assert_response :unprocessable_entity
      assert_template :new
    end

    test "#show" do
      get pokemon_url(@pikachu)
      assert_response :success
    end

    test "#edit" do
      get edit_pokemon_url(@pikachu)
      assert_response :success
    end

    test "#update with success" do
      patch pokemon_url(@pikachu), params: { pokemon: { name: "Updated Pikachu" } }
      assert_redirected_to pokemon_url(@pikachu)
      assert_equal flash[:success], I18n.t("pokemons.update_success")
    end

    test "#update with failure" do
      patch pokemon_url(@pikachu), params: { pokemon: { name: "" } }
      assert_response :unprocessable_entity
      assert_template :edit
    end

    test "#destroy" do
      assert_difference("Pokemon.count", -1) do
        delete pokemon_url(@pikachu, format: :turbo_stream)
      end
      assert_response :success
      assert_equal flash[:success], I18n.t("pokemons.destroy_success")
    end

    test "#search by name" do
      get search_pokemons_url(format: :turbo_stream), params: { search: "Pikachu" }
      assert_response :success
      assert_equal 1, assigns["pokemons"].count
    end

    test "#search by type" do
      get search_pokemons_url(format: :turbo_stream), params: { pokemon_type: "fire" }
      assert_response :success
      assert_equal 1, assigns["pokemons"].count
    end

    test "#search without params" do
      get search_pokemons_url(format: :turbo_stream)
      assert_response :success
      assert_equal Pokemon.count, assigns["pokemons"].count
    end
  end

  class Trainer < PokemonsControllerTest
    setup do
      @pikachu = pokemons(:pikachu)
      @ash = users(:ash)

      sign_in @ash
    end

    test "#index" do
      get pokemons_url
      assert_response :success
    end

    test "#new" do
      get new_pokemon_url
      assert_response :redirect
      assert_redirected_to root_path
    end

    test "#create" do
      assert_no_difference("Pokemon.count") do
        post pokemons_url, params: { pokemon: { name: "Ditto", pokemon_type: "normal" } }
      end
      assert_response :redirect
      assert_redirected_to root_path
    end

    test "#show" do
      get pokemon_url(@pikachu)
      assert_response :success
    end

    test "#edit" do
      get edit_pokemon_url(@pikachu)
      assert_response :redirect
      assert_redirected_to root_path
    end

    test "#update" do
      patch pokemon_url(@pikachu), params: { pokemon: { name: "Updated Pikachu" } }
      assert_response :redirect
      assert_redirected_to root_path
    end

    test "#destroy" do
      assert_no_difference("Pokemon.count") do
        delete pokemon_url(@pikachu, format: :turbo_stream)
      end
      assert_response :redirect
      assert_redirected_to root_path
    end

    test "#search" do
      get search_pokemons_url(format: :turbo_stream), params: { search: "Pikachu" }
      assert_response :success
      assert_equal 1, assigns["pokemons"].count
    end

    test "#search by type" do
      get search_pokemons_url(format: :turbo_stream), params: { pokemon_type: "fire" }
      assert_response :success
      assert_equal 1, assigns["pokemons"].count
    end

    test "#search without params" do
      get search_pokemons_url(format: :turbo_stream)
      assert_response :success
      assert_equal Pokemon.count, assigns["pokemons"].count
    end
  end
end
