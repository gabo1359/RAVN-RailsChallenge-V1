class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :catches, dependent: :destroy
  has_many :pokemons, through: :catches

  self.inheritance_column = :role

  def admin?
    role == "Users::Admin"
  end

  def trainer?
    role == "Users::Trainer"
  end
end
