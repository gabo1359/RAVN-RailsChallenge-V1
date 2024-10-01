require "test_helper"

module Users
  class TrainerTest < ActiveSupport::TestCase
    class Validations < TrainerTest
      setup do
        @trainer = Users::Trainer.new
        @trainer.email = "test@pokedex.com"
        @trainer.password = "123456"
        @trainer.first_name = "First Name"
        @trainer.last_name = "Last Name"
        @trainer.country = "PE"
      end

      test "is invalid with an invalid email" do
        @trainer.email = "wrong email@pokedex.com"
        assert_not @trainer.valid?
      end

      test "is invalid with a password shorter than 6 characters" do
        @trainer.password = "123"
        assert_not @trainer.valid?
      end

      test "is inavlid without a first name" do
        @trainer.first_name = ""
        assert_not @trainer.valid?
      end

      test "is inavlid without a last name" do
        @trainer.last_name = ""
        assert_not @trainer.valid?
      end

      test "is inavlid with an invalid country code" do
        @trainer.country = "WRONG CODE"
        assert_not @trainer.valid?
      end
    end

    class Methods < TrainerTest
      setup do
        @ash = users(:ash)
      end

      test "#full_name" do
        assert "Ash Ketchum", @ash.full_name
      end
    end
  end
end
