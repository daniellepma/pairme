class DishPairingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dish_id, :integer
  attribute :wine_id, :integer
  attribute :description, :string
  attribute :share_link, :string

  # Direct associations

  has_many   :saved_pairings,
             foreign_key: :pairing_id

  belongs_to :wine

  belongs_to :dish

  # Indirect associations
end
