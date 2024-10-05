class RandomFailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    return if rand(1..100) <= 50

    raise "Sorry, I failed randomly :("
  end
end
