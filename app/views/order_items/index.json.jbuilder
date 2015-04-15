json.array!(@order_items) do |order_item|
  json.extract! order_item, :id, :name, :quantity, :price, :order_id
  json.url order_item_url(order_item, format: :json)
end
