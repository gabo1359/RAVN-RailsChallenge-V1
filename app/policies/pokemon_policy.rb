class PokemonPolicy < ApplicationPolicy
  attr_reader :user, :pokemon

  def initialize(user, pokemon)
    @user = user
    @pokemon = pokemon
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def search?
    true
  end
end
