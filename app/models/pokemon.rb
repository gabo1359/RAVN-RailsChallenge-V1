class Pokemon < ApplicationRecord
  include Countriable

  has_many :catches
  has_many :users, through: :catches

  validates :name, :pokemon_type, presence: true

  enum :pokemon_type, %i[normal fighting flying poison ground rock bug ghost steel fire
                         water grass electric psychic ice dragon dark fairy stellar unknown], validate: true

  has_one_attached :image

  scope :ordered, -> { order("LOWER(name)") }
end
