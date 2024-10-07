module SolidQueueDashboard
  module Process
    # Constants
    SUPERVISOR = "Supervisor"
    DISPATCHER = "Dispatcher"
    WORKER = "Worker"
    SCHEDULER = "Scheduler"

    KINDS = [ SUPERVISOR, DISPATCHER, WORKER, SCHEDULER ]

    KIND_COLORS = {
      SUPERVISOR => "blue",
      DISPATCHER => "green",
      WORKER => "yellow",
      SCHEDULER => "purple"
    }

    HEARTBEAT_DEAD_THRESHOLD = 1.minute

    def self.kind_color(kind)
      KIND_COLORS[kind] || "zinc"
    end
  end
end
