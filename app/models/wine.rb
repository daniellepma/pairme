class Wine < ApplicationRecord
  # Direct associations

  has_many   :dish_pairings,
             :dependent => :destroy

  has_many   :cuisine_pairings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    varietal
  end

end
