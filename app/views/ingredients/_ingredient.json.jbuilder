json.extract! ingredient, :id, :name, :quantity, :menu_item_id, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
