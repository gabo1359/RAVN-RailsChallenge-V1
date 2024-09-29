class PokemonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @pokemons = pagy(Pokemon.order(:name), limit: 4)
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      raise
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type)
  end
end
