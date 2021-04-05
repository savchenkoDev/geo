require 'geocoder'
require 'byebug'

class Application
  class << self
    attr_accessor :logger

    def root
      File.expand_path('..', __dir__)
    end

    def environment
      ENV.fetch('RACK_ENV').to_sym
    end
  end
end