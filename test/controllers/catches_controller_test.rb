require "test_helper"

class CatchesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  class Admin < CatchesControllerTest
    setup do
      @pikachu = pokemons(:pikachu)
      @admin = users(:admin)

      sign_in @admin
    end

    test "#index" do
      get catches_url
      assert_response :redirect
      assert_redirected_to root_path
    end

    test "#new" do
      get new_catch_url
      assert_response :redirect
      assert_redirected_to root_path
    end

    test "#create" do
      assert_no_difference("Catch.count") do
        post catches_url, params: { catch: { pokemon_id: @pikachu.id } }
      end
      assert_response :redirect
      assert_redirected_to root_path
    end
  end

  class Trainer < CatchesControllerTest
    setup do
      @pikachu = pokemons(:pikachu)
      @ash = users(:ash)

      sign_in @ash
    end

    test "#index" do
      get catches_url
      assert_response :success
    end

    test "#new" do
      get new_catch_url(format: :turbo_stream)
      assert_response :success
    end

    test "#create with success" do
      assert_difference("Catch.count") do
        post catches_url(format: :turbo_stream), params: { catch: { pokemon_id: @pikachu.id, alias: "Alias" } }
      end
      assert_redirected_to catches_url
      assert_equal flash[:success], I18n.t("catches.create_success")
    end

    test "#create with failure" do
      assert_no_difference("Catch.count") do
        post catches_url(format: :turbo_stream), params: { catch: { pokemon_id: "" } }
      end
      assert_response :unprocessable_entity
      assert_template :new
    end
  end
end
