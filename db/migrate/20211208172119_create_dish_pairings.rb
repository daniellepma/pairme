class CreateDishPairings < ActiveRecord::Migration[6.0]
  def change
    create_table :dish_pairings do |t|
      t.integer :dish_id
      t.integer :wine_id
      t.string :description
      t.string :share_link

      t.timestamps
    end
  end
end
