class Notifier
  def self.notify(opt={})
    # Rabbitmq notifier (boxes as default queue)
    queue = opt.delete(:queue) || 'boxes'
    conn = Bunny.new(ENV['RABBITMQ_URL']) # It use default config if RABBITMQ_URL is undefined
    conn.start
    ch = conn.create_channel
    ch.default_exchange.publish(opt.to_json, routing_key: queue)
    conn.close
  end
end