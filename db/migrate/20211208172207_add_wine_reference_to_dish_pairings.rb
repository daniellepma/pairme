class AddWineReferenceToDishPairings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :dish_pairings, :wines
    add_index :dish_pairings, :wine_id
    change_column_null :dish_pairings, :wine_id, false
  end
end
