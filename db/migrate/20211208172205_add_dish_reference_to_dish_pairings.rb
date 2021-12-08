class AddDishReferenceToDishPairings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :dish_pairings, :dishes
    add_index :dish_pairings, :dish_id
    change_column_null :dish_pairings, :dish_id, false
  end
end
