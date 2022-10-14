class StuffContainerJob < ApplicationJob
  queue_as :default

  def perform(container); end
end
