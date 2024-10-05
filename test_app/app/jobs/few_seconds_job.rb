class FewSecondsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sleep rand(1..3).seconds
  end
end
