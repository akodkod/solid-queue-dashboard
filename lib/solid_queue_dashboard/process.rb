module SolidQueueDashboard
  module Process
    # Constants
    SUPERVISOR = "Supervisor"
    DISPATCHER = "Dispatcher"
    WORKER = "Worker"
    SCHEDULER = "Scheduler"

    KINDS = [ SUPERVISOR, DISPATCHER, WORKER, SCHEDULER ]

    KIND_COLORS = {
      SUPERVISOR => "yellow",
      DISPATCHER => "green",
      WORKER => "sky",
      SCHEDULER => "purple"
    }

    HEARTBEAT_DEAD_THRESHOLD = 3.minutes

    def self.kind_color(kind)
      KIND_COLORS[kind] || "zinc"
    end
  end
end
