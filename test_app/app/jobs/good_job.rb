class GoodJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # I'm a good job. I never fail :)
  end
end
