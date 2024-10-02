class CreateCatches < ActiveRecord::Migration[7.2]
  def change
    create_table :catches do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true
      t.string :alias

      t.timestamps
    end
  end
end
