class Pokemon < ApplicationRecord
  validates :name, :pokemon_type, presence: true

  enum pokemon_type: %i[normal fighting flying poison ground rock bug ghost steel fire
                        water grass electric psychic ice dragon dark fairy stellar unknown]
end
