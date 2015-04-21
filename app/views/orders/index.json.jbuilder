json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :food_truck_id
  json.url order_url(order, format: :json)
end
