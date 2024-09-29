class CreatePokemons < ActiveRecord::Migration[7.2]
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.string :main_technique
      t.string :country
      t.integer :pokemon_type, null: false, default: 0
      t.text :description

      t.timestamps
    end
  end
end
