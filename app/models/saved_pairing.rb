class SavedPairing < ApplicationRecord
  # Direct associations

  belongs_to :dish,
             optional: true,
             class_name: "DishPairing",
             foreign_key: "pairing_id",
             counter_cache: true

  belongs_to :cuisine,
             optional: true,
             class_name: "CuisinePairing",
             foreign_key: "pairing_id",
             counter_cache: true

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
