class UserMailer < ApplicationMailer
  def pokemon_catched(user, catch)
    @user = user
    @catch = catch
    mail(to: user.email, subject: t("mailer.pokemon_catched.subject"))
  end

  def inactivity_reminder(user, days)
    @user = user
    @days = days
    mail(to: user.email, subject: t("mailer.inactivity_reminder.subject"))
  end
end
