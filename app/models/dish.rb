class Dish < ApplicationRecord
  # Direct associations

  has_many   :dish_pairings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
