require "test_helper"

module Users
  class AdminTest < ActiveSupport::TestCase
    class Validations < AdminTest
      setup do
        @admin = Users::Admin.new
      end

      test "is invalid without an email and a password" do
        assert_not @admin.valid?
      end

      test "is invalid with an invalid email" do
        @admin.email = "wrong email@pokedex.com"
        @admin.password = "123456"
        assert_not @admin.valid?
      end

      test "is invalid with a password shorter than 6 characters" do
        @admin.email = "test@pokedex.com"
        @admin.password = "123"
        assert_not @admin.valid?
      end
    end
  end
end
