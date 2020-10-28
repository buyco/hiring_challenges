class ApplicationController < Sinatra::Base
  set :show_exceptions, false

  error ArgumentError do |exception|
    content_type :json
    status 422
    {
      errors: exception.message
    }.to_json
  end

  # Boxes
  get '/api/boxes' do
    content_type :json
    st, res = Controller::Api::BoxesController.new(self).index
    status st
    res.to_json
  end

  post '/api/boxes' do
    content_type :json
    st, res = Controller::Api::BoxesController.new(self).create
    status st
    res.to_json
  end

  # Counter type
  get '/api/box_types_counters' do
    content_type :json
    st, res = Controller::Api::BoxTypesCountersController.new(self).index
    status st
    res.to_json
  end
end