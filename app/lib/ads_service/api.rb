module AdsService
  module Api
    def update_coordinates(id, coordinates)
      response = connection.patch("v1/#{id}") do |req|
        req.params = { coordinates: coordinates }
      end
    end
  end
end