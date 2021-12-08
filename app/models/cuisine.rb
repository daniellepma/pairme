class Cuisine < ApplicationRecord
  # Direct associations

  has_many   :cuisine_pairings,
             dependent: :destroy

  # Indirect associations

  has_one    :wine,
             through: :cuisine_pairings,
             source: :wine

  # Validations

  # Scopes

  def to_s
    name
  end
end
