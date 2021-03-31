module AdsService
  module Api
    def update_coordinates(id, coordinates)
      response = connection.patch("v1/#{id}") do |req|
        req.params = { coordinates: coordinates }
        req.headers['X-Request-Id'] = Thread.current[:request_id]
      end

      Application.logger.info(
        'update coordinates',
        headers: {
          request_id: Thread.current[:request_id]
        },
        response: {
          status: response.status
        }
      )
    end
  end
end