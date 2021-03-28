require_relative 'api'
require 'json'

module AdsService
  class Client
    include AdsService::Api
    # See https://dry-rb.org/gems/dry-initializer/3.0/skip-undefined/
    extend Dry::Initializer[undefined: false]

    option :url, default: -> { Settings.ads_service.url }
    option :connection, default: -> { build_connection }

    private

    def build_connection
      Faraday.new(@url) do |connect|
        connect.request :json
        connect.response :json, content_type: /\bjson$/
        connect.adapter Faraday.default_adapter
      end
    end
  end
end