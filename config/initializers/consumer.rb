channel = RabbitMQ.consumer_channel
queue = channel.queue('geocoding', durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  payload = JSON(payload)
  Thread.current[:request_id] = properties.headers['request_id']

  coordinates = GeocoderService.geocode(payload['city'])

  Application.logger.info(
    'geocoded coordinates',
    headers: {
      request_id: Thread.current[:request_id]
    },
    city: payload['city'],
    coordinates: coordinates
  )

  if coordinates.present?
    Metrics.geocoding_requests_counter.increment(labels: {result: 'success'})
    client = AdsService::Client.new
    client.update_coordinates(payload['id'], coordinates)
  else
    Metrics.geocoding_requests_counter.increment(labels: {result: 'failure'})
  end

  channel.ack(delivery_info.delivery_tag)
end