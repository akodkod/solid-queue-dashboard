module SolidQueueDashboard
  class DashboardController < ApplicationController
    def index
      @jobs = SolidQueueDashboard.decorate(SolidQueue::Job.all)
      load_charts
    end

    private

    def load_charts
      case params[:chart_period] || "30m"
      when "15m"
        n = 1
        last = 15
      when "30m"
        n = 1
        last = 30
      when "1h"
        n = 2
        last = 30
      when "3h"
        n = 6
        last = 30
      when "6h"
        n = 12
        last = 30
      when "12h"
        n = 20
        last = 36
      when "1d"
        n = 30
        last = 48
      when "3d"
        n = 90 # 1.5 hours
        last = 48
      when "1w"
        n = 180 # 3 hours
        last = 56
      else
        n = 1
        last = 30
      end

      @charts = [
        {
          name: "Enqueued",
          data: SolidQueue::Job.group_by_minute(:created_at, last: last, n: n).count,
          color: "#A1A1AB"
        },
        {
          name: "Finished",
          data: @jobs.finished.group_by_minute(:finished_at, last: last, n: n).count,
          color: "#23C55E"
        },
        {
          name: "Retried",
          data: @jobs.retried.group_by_minute(:finished_at, last: last, n: n).count,
          color: "#FBBF26"
        },
        {
          name: "Failed",
          data: SolidQueue::FailedExecution.group_by_minute(:created_at, last: last, n: n).count,
          color: "#F04444"
        }
      ]
    end
  end
end
