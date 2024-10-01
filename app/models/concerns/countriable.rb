module Countriable
  extend ActiveSupport::Concern

  included do
    validates :country, inclusion: { in: :valid_countries }
  end

  private

  def valid_countries
    ISO3166::Country.all.map(&:alpha2) + ["", nil]
  end
end
