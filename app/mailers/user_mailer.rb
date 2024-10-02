class UserMailer < ApplicationMailer
  def pokemon_catched(user, catch)
    @user = user
    @catch = catch
    mail(to: user.email, subject: t("mailer.pokemon_catched.subject"))
  end
end
