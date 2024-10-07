module SolidQueueDashboard
  module Decorators
    class ProcessDecorator < SimpleDelegator
      def color
        Process.kind_color(kind)
      end

      def dead?
        last_heartbeat_at < Process::HEARTBEAT_DEAD_THRESHOLD.ago
      end
    end
  end
end
