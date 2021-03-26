module AdsService
  module RpcApi
    def update_coordinates(id, coordinates)
      payload = { id: id, coordinates: coordinates }.to_json
      
      publish(payload, type: 'update_coordinates')
    end
  end
end