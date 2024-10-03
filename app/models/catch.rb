# == Schema Information
#
# Table name: catches
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  pokemon_id :integer          not null
#  alias      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Catch < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  scope :ordered, -> { order(created_at: :desc) }
end
