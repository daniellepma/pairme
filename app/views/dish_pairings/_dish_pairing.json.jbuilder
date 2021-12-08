json.extract! dish_pairing, :id, :dish_id, :wine_id, :description, :share_link,
              :created_at, :updated_at
json.url dish_pairing_url(dish_pairing, format: :json)
