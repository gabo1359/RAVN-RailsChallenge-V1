class Pokemon < ApplicationRecord
  validates :name, :pokemon_type, presence: true
  validates :country, inclusion: { in: :valid_countries }

  enum :pokemon_type, %i[normal fighting flying poison ground rock bug ghost steel fire
                         water grass electric psychic ice dragon dark fairy stellar unknown], validate: true

  private

  def valid_countries
    ISO3166::Country.all.map(&:alpha2) << ""
  end
end
