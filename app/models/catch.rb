class Catch < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  scope :ordered, -> { order(created_at: :desc) }
end
