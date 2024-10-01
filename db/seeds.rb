# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

p "Cleaning database"

User.destroy_all
Pokemon.destroy_all

p "Creating admin"

Users::Admin.create(email: "admin@pokedex.com", password: "123123")

p "Creating trainers"

countries = ISO3166::Country.all.map(&:alpha2)

20.times do
  first_name = Faker::Name.first_name

  Users::Trainer.create(
    email: "#{first_name}@pokedex.com",
    password: "123123",
    first_name: first_name,
    last_name: Faker::Name.last_name,
    country: countries.sample,
  )
end

p "Creating pokemons"

pokemon_types = Pokemon.pokemon_types.keys

20.times do
  Pokemon.create(
    name: Faker::Games::Pokemon.name,
    main_technique: Faker::Games::Pokemon.move,
    country: countries.sample,
    pokemon_type: pokemon_types.sample,
    description: Faker::Lorem.paragraph
  )
end
