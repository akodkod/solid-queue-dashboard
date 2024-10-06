module SolidQueueDashboard
  module Decorators
    class ProcessDecorator < SimpleDelegator
      def dead?
        last_heartbeat_at < Process::HEARTBEAT_DEAD_THRESHOLD.ago
      end
    end
  end
end
