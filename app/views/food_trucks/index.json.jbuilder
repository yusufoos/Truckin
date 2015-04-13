json.array!(@food_trucks) do |food_truck|
  json.extract! food_truck, :id, :merchantUserEmail, :name, :longitude, :latitude, :user_id
  json.url food_truck_url(food_truck, format: :json)
end
