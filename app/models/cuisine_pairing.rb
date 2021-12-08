class CuisinePairing < ApplicationRecord
  # Direct associations

  belongs_to :wine

  belongs_to :cuisine

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    cuisine.to_s
  end

end
