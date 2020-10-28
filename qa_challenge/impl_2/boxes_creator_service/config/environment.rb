require 'require_all'
require 'bundler/setup'
require_relative '../db/connector'
require_relative '../db/initializer'

ENV['SINATRA_ENV'] ||= "development"

# Global gems load
Bundler.require(:default, ENV['SINATRA_ENV'])

# Global app folder load
require_all 'app'

# Create needed db tables if not exist
init_db