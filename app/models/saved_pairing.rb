class SavedPairing < ApplicationRecord
  # Direct associations

  belongs_to :cuisine,
             :required => false,
             :class_name => "CuisinePairing",
             :foreign_key => "pairing_id",
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
