module SolidQueueDashboard
  module Decorators
    class RecurringTaskDecorator < SimpleDelegator
      def type
        if command.present?
          RecurringTask::COMMAND
        elsif class_name.present?
          RecurringTask::JOB
        else
          "Unknown"
        end
      end

      def next_runs(count: 5)
        cron = Fugit.parse(schedule)
        return [] unless cron

        cron.next.take(count)
      end
    end
  end
end
