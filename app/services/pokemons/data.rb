module Pokemons
  class Data < BaseService
    def initialize(params)
      @search = params[:search]
      @pokemon_type = params[:pokemon_type]
    end

    def call
      data
      search_by_type
      search_by_name
    end

    private

    attr_reader :search, :pokemon_type

    def data
      @pokemons = Pokemon.order("LOWER(name)")
    end

    def search_by_type
      return unless Pokemon.pokemon_types.include?(pokemon_type)

      @pokemons = @pokemons.where(pokemon_type:)
    end

    def search_by_name
      @pokemons.where("name LIKE ?", "%#{search}%")
    end
  end
end
