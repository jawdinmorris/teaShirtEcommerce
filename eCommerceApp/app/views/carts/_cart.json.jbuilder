json.extract! cart, :id, :item_id, :user_id, :quantity, :created_at, :updated_at
json.url cart_url(cart, format: :json)
