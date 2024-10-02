require "test_helper"

module Admin
  class TrainersControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    class Admin < TrainersControllerTest
      setup do
        @admin = users(:admin)
        @misti = users(:misti)

        sign_in @admin
      end

      test "#index" do
        get trainers_url
        assert_response :success
      end

      test "#new" do
        get new_trainer_url
        assert_response :success
      end

      test "#create with success" do
        assert_difference("Users::Trainer.count") do
          post trainers_url, params: { trainer: { email: "brock@pokedex.com", password: "123456", first_name: "Brock", last_name: "Rock", country: "PE" } }
        end
        assert_redirected_to trainers_url
        assert_equal flash[:success], I18n.t("trainers.create_success")
      end

      test "#create with failure" do
        assert_no_difference("Users::Trainer.count") do
          post trainers_url, params: { trainer: { email: "brock@pokedex.com", password: "" } }
        end
        assert_response :unprocessable_entity
        assert_template :new
      end

      test "#show" do
        get trainer_url(@misti)
        assert_response :success
      end

      test "#edit" do
        get edit_trainer_url(@misti)
        assert_response :success
      end

      test "#update with success" do
        patch trainer_url(@misti), params: { trainer: { first_name: "Updated Misti" } }
        assert_redirected_to trainer_url(@misti)
        assert_equal flash[:success], I18n.t("trainers.update_success")
      end

      test "#update with failure" do
        patch trainer_url(@misti), params: { trainer: { first_name: "" } }
        assert_response :unprocessable_entity
        assert_template :edit
      end

      test "#destroy" do
        assert_difference("Users::Trainer.count", -1) do
          delete trainer_url(@misti, format: :turbo_stream)
        end
        assert_response :success
        assert_equal flash[:success], I18n.t("trainers.destroy_success")
      end

      test "#search by name" do
        get search_trainers_url(format: :turbo_stream), params: { search: "Ash" }
        assert_response :success
        assert_equal 1, assigns["trainers"].count
      end

      test "#search without params" do
        get search_trainers_url(format: :turbo_stream)
        assert_response :success
        assert_equal Users::Trainer.count, assigns["trainers"].count
      end
    end

    class Trainer < TrainersControllerTest
      setup do
        @ash = users(:ash)
        @misti = users(:misti)

        sign_in @ash
      end

      test "#index" do
        get trainers_url
        assert_response :redirect
        assert_redirected_to root_path
      end

      test "#new" do
        get new_trainer_url
        assert_response :redirect
        assert_redirected_to root_path
      end

      test "#create" do
        assert_no_difference("Users::Trainer.count") do
          post trainers_url, params: { trainer: { email: "brock@pokedex.com", password: "123456", first_name: "Brock", last_name: "Rock", country: "PE" } }
        end
        assert_response :redirect
        assert_redirected_to root_path
      end

      test "#show own profile" do
        get trainer_url(@ash)
        assert_response :success
      end

      test "#show other profile" do
        get trainer_url(@misti)
        assert_response :redirect
        assert_redirected_to root_path
      end

      test "#edit" do
        get edit_trainer_url(@ash)
        assert_response :redirect
        assert_redirected_to root_path
      end

      test "#update" do
        patch trainer_url(@ash), params: { trainer: { first_name: "Updated Ash" } }
        assert_response :redirect
        assert_redirected_to root_path
      end

      test "#destroy" do
        assert_no_difference("Users::Trainer.count") do
          delete trainer_url(@misti, format: :turbo_stream)
        end
        assert_response :redirect
        assert_redirected_to root_path
      end

      test "#search" do
        get search_trainers_url(format: :turbo_stream), params: { search: "Ash" }
        assert_response :redirect
        assert_redirected_to root_path
      end
    end
  end
end
