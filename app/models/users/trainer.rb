module Users
  class Trainer < User
    include Countriable

    validates :first_name, :last_name, :country, presence: true

    has_one_attached :avatar

    def full_name
      "#{first_name.squish.capitalize} #{last_name.squish.capitalize}"
    end
  end
end
