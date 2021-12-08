class AddCuisineReferenceToCuisinePairings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cuisine_pairings, :cuisines
    add_index :cuisine_pairings, :cuisine_id
    change_column_null :cuisine_pairings, :cuisine_id, false
  end
end
