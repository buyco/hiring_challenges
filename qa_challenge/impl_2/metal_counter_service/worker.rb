require 'bundler/setup'
require 'sneakers/runner'
require_relative './config/environment'
require_relative './lib/increment_service'

Bundler.require(:default, ENV['SERVICE_ENV'])

class Processor
  include Sneakers::Worker
  from_queue :boxes

  def work(msg)
    IncrementService.increment(JSON.parse(msg))
    ack!
  end
end

if ENV['SERVICE_ENV'] == 'production'
  Sneakers.configure(:amqp => ENV['RABBITMQ_URL'], :daemonize => false, :log => STDOUT) if ENV['SERVICE_ENV'] == 'production'
  r = Sneakers::Runner.new([ Processor ])
  r.run
end
