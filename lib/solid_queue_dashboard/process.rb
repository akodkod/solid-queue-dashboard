module SolidQueueDashboard
  module Process
    # Constants
    SUPERVISOR = "Supervisor"
    DISPATCHER = "Dispatcher"
    WORKER = "Worker"
    SCHEDULER = "Scheduler"

    KINDS = [ SUPERVISOR, DISPATCHER, WORKER, SCHEDULER ]

    HEARTBEAT_DEAD_THRESHOLD = 1.minute
  end
end
