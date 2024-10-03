# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  country                :string
#  role                   :string
#
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
