class AddSavedPairingCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :saved_pairings_count, :integer
  end
end
