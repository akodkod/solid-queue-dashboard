class AlwaysFailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    raise "Sorry, I always fail :)"
  end
end
