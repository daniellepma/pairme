class CreateSavedPairings < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_pairings do |t|
      t.integer :user_id
      t.integer :pairing_id

      t.timestamps
    end
  end
end
