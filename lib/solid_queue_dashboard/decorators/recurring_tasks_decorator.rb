module SolidQueueDashboard
  module Decorators
    class RecurringTasksDecorator < SimpleDelegator
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
