class AddCuisineReferenceToSavedPairings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :saved_pairings, :cuisine_pairings, column: :pairing_id
    add_index :saved_pairings, :pairing_id
  end
end
