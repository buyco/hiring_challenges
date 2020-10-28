require 'bundler/setup'
require 'sneakers/runner'

ENV['SERVICE_ENV'] ||= "development"

Bundler.require(:default, ENV['SERVICE_ENV'])

class ApplicationController < Sinatra::Base 
end