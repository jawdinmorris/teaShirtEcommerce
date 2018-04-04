json.extract! item, :id, :name, :description, :image, :price, :stock_status, :visibility, :order_id, :created_at, :updated_at
json.url item_url(item, format: :json)
