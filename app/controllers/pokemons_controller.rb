class PokemonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_data, only: %i[index search]
  before_action :set_pokemon, only: %i[show edit update destroy]

  def index; end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      flash[:success] = t("pokemons.create_success")
      redirect_to pokemons_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @pokemon.update(pokemon_params)
      flash[:success] = t("pokemons.update_success")
      redirect_to pokemon_path(@pokemon)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon.destroy
    flash.now[:success] = t("pokemons.destroy_success")
  end

  def search; end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :main_technique, :image, :country, :pokemon_type, :description)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def set_data
    pokemons = Pokemons::Data.call(params)
    @pagy, @pokemons = pagy(pokemons, limit: 4)
  end
end
