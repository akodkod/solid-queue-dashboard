class LongRunningJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sleep rand(10..60).minutes
  end
end
