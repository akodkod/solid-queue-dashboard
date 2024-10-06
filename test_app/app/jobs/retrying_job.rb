class RetryingJob < ApplicationJob
  queue_as :default
  retry_on StandardError, wait: 5.seconds, attempts: 3

  def perform(*args)
    raise "Sorry, I always fail but will retry 3 times"
  end
end
