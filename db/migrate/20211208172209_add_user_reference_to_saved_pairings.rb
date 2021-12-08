class AddUserReferenceToSavedPairings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :saved_pairings, :users
    add_index :saved_pairings, :user_id
    change_column_null :saved_pairings, :user_id, false
  end
end
