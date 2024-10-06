module SolidQueueDashboard
  class DashboardController < ApplicationController
    def index
      @jobs = SolidQueueDashboard.decorate(SolidQueue::Job.all)
      @class_names = SolidQueueDashboard.class_names
    end
  end
end
