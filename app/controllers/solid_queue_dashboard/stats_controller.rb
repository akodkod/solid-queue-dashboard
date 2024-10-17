module SolidQueueDashboard
  class StatsController < ApplicationController
    def index
      @jobs = SolidQueueDashboard.decorate(SolidQueue::Job.all)
      @job_class_names = SolidQueueDashboard.job_class_names
    end
  end
end
