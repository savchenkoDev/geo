require 'geocoder'

module GeocoderService
  extend self

  attr_reader :coordinates

  def geocode(city)
    cities = ::Geocoder.search(city)
    coordinates = {}
    return {} if cities.blank?

    coordinates[:lat], coordinates[:lon] = cities.first.coordinates

    coordinates
  end
end