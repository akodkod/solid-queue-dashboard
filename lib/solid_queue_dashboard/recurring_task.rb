module SolidQueueDashboard
  module RecurringTask
    # Constants
    COMMAND = :command
    JOB = :job

    TYPES = [ COMMAND, JOB ]

    TYPE_COLORS = {
      COMMAND => "amber",
      JOB => "sky"
    }
  end
end
