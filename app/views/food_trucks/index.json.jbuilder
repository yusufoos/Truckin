json.array!(@food_trucks) do |food_truck|
  json.extract! food_truck, :id, :foodTruckID, :merchantUserEmail, :name, :type, :longitude, :latitude
  json.url food_truck_url(food_truck, format: :json)
end
