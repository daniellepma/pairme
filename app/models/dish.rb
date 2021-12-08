class Dish < ApplicationRecord
  # Direct associations

  has_many   :dish_pairings,
             dependent: :destroy

  # Indirect associations

  has_one    :wine,
             through: :dish_pairings,
             source: :wine

  # Validations

  # Scopes

  def to_s
    name
  end
end
