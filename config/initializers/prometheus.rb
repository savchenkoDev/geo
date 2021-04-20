require 'prometheus/client'
require 'prometheus/middleware/exporter'

Metrics.configure do |registry|
  registry.counter(
    :geocoding_requests_counter,
    docstring: 'The total number of geocoding requests',
    labels: %i[result]
  )
end