json.extract! saved_pairing, :id, :user_id, :pairing_id, :created_at, :updated_at
json.url saved_pairing_url(saved_pairing, format: :json)
