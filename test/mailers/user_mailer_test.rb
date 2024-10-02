require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  setup do
    @ash = users(:ash)
    @catch = catches(:catch)
    @days = rand(10)
  end

  test "#pokemon_catched" do
    email = UserMailer.pokemon_catched(@ash, @catch)

    assert_emails 1 do
      email.deliver_now
    end
    assert_equal ["profesor_oak@pokedex.com"], email.from
    assert_equal ["ash@pokedex.com"], email.to
    assert_equal I18n.t("mailer.pokemon_catched.subject"), email.subject
  end

  test "#inactivity_reminder" do
    email = UserMailer.inactivity_reminder(@ash, @days)

    assert_emails 1 do
      email.deliver_now
    end
    assert_equal ["profesor_oak@pokedex.com"], email.from
    assert_equal ["ash@pokedex.com"], email.to
    assert_equal I18n.t("mailer.inactivity_reminder.subject"), email.subject
  end
end
