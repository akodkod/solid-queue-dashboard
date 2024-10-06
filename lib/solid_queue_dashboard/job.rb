module SolidQueueDashboard
  module Job
    # Constants
    SUCCESS = :success
    RETRIED = :retried
    FAILED = :failed
    PENDING = :pending
    SCHEDULED = :scheduled

    STATUSES = [ SUCCESS, RETRIED, FAILED, SCHEDULED, PENDING ]
  end
end
