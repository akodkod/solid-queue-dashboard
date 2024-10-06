module SolidQueueDashboard
  module Job
    # Constants
    SUCCESS = :success
    RETRIED = :retried
    FAILED = :failed
    SCHEDULED = :scheduled
    PENDING = :pending

    STATUSES = [ SUCCESS, RETRIED, FAILED, SCHEDULED, PENDING ]
  end
end
