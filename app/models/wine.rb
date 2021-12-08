class Wine < ApplicationRecord
  # Direct associations

  has_many   :dish_pairings,
             :dependent => :destroy

  has_many   :cuisine_pairings,
             :dependent => :destroy

  # Indirect associations

  has_many   :cuisines,
             :through => :cuisine_pairings,
             :source => :cuisine

  has_many   :dishes,
             :through => :dish_pairings,
             :source => :dish

  # Validations

  # Scopes

  def to_s
    varietal
  end

end
