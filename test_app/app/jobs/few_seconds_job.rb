class FewSecondsJob < ApplicationJob
  queue_as :another_queue

  def perform(*args)
    sleep rand(1..3).seconds
  end
end
