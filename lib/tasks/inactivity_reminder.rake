namespace :inactivity_reminder do
  task send: :environment do
    inactive_users = Users::Trainer.joins(:catches).where("catches.created_at < ?", 1.week.ago).distinct.includes(:catches)
    inactive_users.each do |inactive_user|
      days = days_until_now(inactive_user.catches.last.created_at)
      UserMailer.inactivity_reminder(inactive_user, days).deliver_later
    end
  end
end

def days_until_now(time)
  ((Time.current - time) / (60 * 60 * 24)).to_i
end
