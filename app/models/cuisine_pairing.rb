class CuisinePairing < ApplicationRecord
  # Direct associations

  has_many   :saved_pairings,
             foreign_key: "pairing_id",
             dependent: :destroy

  belongs_to :wine

  belongs_to :cuisine

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    cuisine.to_s
  end
end
