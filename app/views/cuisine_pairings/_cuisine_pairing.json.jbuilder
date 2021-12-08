json.extract! cuisine_pairing, :id, :cuisine_id, :wine_id, :description,
              :share_link, :created_at, :updated_at
json.url cuisine_pairing_url(cuisine_pairing, format: :json)
