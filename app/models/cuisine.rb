class Cuisine < ApplicationRecord
  # Direct associations

  has_many   :cuisine_pairings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
