require 'geocoder'

module GeocoderService
  extend self

  attr_reader :coordinates

  def geocode(city)
    cities = ::Geocoder.search(city)
    coordinates = {}
    coordinates[:lat], coordinates[:lon] = cities.first.coordinates

    coordinates
  end
end