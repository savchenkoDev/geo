# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'rake'
gem 'rack'
gem 'puma'

gem 'i18n'
gem 'config'

gem 'bunny'

gem 'dry-validation'
gem 'dry-initializer'
gem 'prometheus-client'

gem 'geocoder'

gem 'activesupport', '~> 6.0.0', require: false
gem 'fast_jsonapi', '~> 1.5'

gem 'faraday'
gem 'faraday_middleware'
gem 'ougai'

gem 'activesupport', '~> 6.0.0', require: false
gem 'fast_jsonapi', '~> 1.5'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'amazing_print'
end

group :test do
  gem 'rspec', '~> 3.9.0'
  gem 'factory_bot', '~> 5.2.0'
end