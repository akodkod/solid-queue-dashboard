module SolidQueueDashboard
  module Decorators
    class RecurringTasksDecorator < SimpleDelegator
      def with_type(type)
        case type.to_sym
        when RecurringTask::JOB
          where.not(class_name: nil)
        when RecurringTask::COMMAND
          where.not(command: nil)
        else
          raise "Unknown type: #{type}"
        end
      end

      def each
        super do |task|
          yield RecurringTaskDecorator.new(task)
        end
      end

      def to_a
        super.map { |task| RecurringTaskDecorator.new(task) }
      end
    end
  end
end
