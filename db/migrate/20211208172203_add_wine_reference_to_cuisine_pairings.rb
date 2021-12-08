class AddWineReferenceToCuisinePairings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cuisine_pairings, :wines
    add_index :cuisine_pairings, :wine_id
    change_column_null :cuisine_pairings, :wine_id, false
  end
end
