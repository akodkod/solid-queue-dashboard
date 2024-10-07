module SolidQueueDashboard
  module Job
    # Constants
    SUCCESS = :success
    RETRIED = :retried
    FAILED = :failed
    PENDING = :pending
    SCHEDULED = :scheduled

    STATUSES = [ SUCCESS, RETRIED, FAILED, SCHEDULED, PENDING ]

    STATUS_COLORS = {
      SUCCESS => "green",
      RETRIED => "amber",
      FAILED => "red",
      SCHEDULED => "blue",
      PENDING => "zinc"
    }

    COMMAND_CLASS_NAME = "SolidQueue::RecurringJob"

    def self.status_color(status)
      STATUS_COLORS[status] || "zinc"
    end
  end
end
