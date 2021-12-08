class SavedPairingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :pairing_id, :integer

  # Direct associations

  belongs_to :cuisine,
             resource: CuisinePairingResource,
             foreign_key: :pairing_id

  belongs_to :user

  # Indirect associations

end
