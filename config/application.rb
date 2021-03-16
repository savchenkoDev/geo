require 'sinatra'
require "sinatra/json"
require 'geocoder'
require 'byebug'

class Application < Sinatra::Base

  

  configure do
    set :app_file, File.expand_path('../config.ru', __dir__)
  end

  configure :development do
    set :show_exceptions, false
  end
end