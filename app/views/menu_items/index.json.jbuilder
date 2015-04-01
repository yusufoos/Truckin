json.array!(@menu_items) do |menu_item|
  json.extract! menu_item, :id, :menuItemID, :foodTruckID, :name, :price, :description
  json.url menu_item_url(menu_item, format: :json)
end
