module SolidQueueDashboard
  module Decorators
    class ProcessesDecorator < SimpleDelegator
      def each
        super do |job|
          yield ProcessDecorator.new(job)
        end
      end

      def to_a
        super.map { |job| ProcessDecorator.new(job) }
      end
    end
  end
end
