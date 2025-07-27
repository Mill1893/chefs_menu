json.extract! daily_menu_item, :id, :name, :description, :category, :daily_menu_id, :created_at, :updated_at
json.url daily_menu_item_url(daily_menu_item, format: :json)
