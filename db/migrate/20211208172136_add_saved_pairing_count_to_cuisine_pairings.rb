class AddSavedPairingCountToCuisinePairings < ActiveRecord::Migration[6.0]
  def change
    add_column :cuisine_pairings, :saved_pairings_count, :integer
  end
end
