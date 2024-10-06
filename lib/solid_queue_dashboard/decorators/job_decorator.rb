module SolidQueueDashboard
  module Decorators
    class JobDecorator < SimpleDelegator
      def status
        return @status if defined?(@status)

        @status = if retried?
          Job::RETRIED
        elsif failed?
          Job::FAILED
        elsif success?
          Job::SUCCESS
        elsif scheduled?
          Job::SCHEDULED
        else
          Job::PENDING
        end
      end

      def success?
        return @success if defined?(@success)
        @success = finished_at.present? && !failed? && !retried?
      end

      def retried?
        return @retried if defined?(@retried)
        @retried = finished_at.present? && !failed_execution.present? &&
          (arguments["executions"].to_i > 0 || execution_history.where(scheduled_at: finished_at..).any?)
      end

      def failed?
        return @failed if defined?(@failed)
        @failed = failed_execution.present?
      end

      def scheduled?
        return @scheduled if defined?(@scheduled)
        @scheduled = scheduled_at.present? && scheduled_at > Time.current
      end

      def pending?
        return @pending if defined?(@pending)
        @pending = !finished_at.present?
      end

      def execution_history
        SolidQueue::Job.where(active_job_id: active_job_id)
      end

      def error_message
        return @error_message if defined?(@error_message)

        @error_message = failed_execution ?
          "#{failed_execution.error["exception_class"]}: #{failed_execution.error["message"]}" :
          nil
      end
    end
  end
end
