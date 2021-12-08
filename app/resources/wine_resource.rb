class WineResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :varietal, :string

  # Direct associations

  has_many   :dish_pairings

  has_many   :cuisine_pairings

  # Indirect associations

  many_to_many :dishes

end
