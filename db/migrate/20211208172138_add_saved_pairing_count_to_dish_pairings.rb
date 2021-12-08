class AddSavedPairingCountToDishPairings < ActiveRecord::Migration[6.0]
  def change
    add_column :dish_pairings, :saved_pairings_count, :integer
  end
end
