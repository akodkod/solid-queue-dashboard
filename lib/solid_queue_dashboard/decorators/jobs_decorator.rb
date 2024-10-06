module SolidQueueDashboard
  module Decorators
    class JobsDecorator < SimpleDelegator
      def with_status(status)
        case status.to_sym
        when Job::SUCCESS
          success
        when Job::FAILED
          failed
        when Job::SCHEDULED
          scheduled
        when Job::PENDING
          pending
        when Job::RETRIED
          retried
        else
          raise "Invalid status: #{status}"
        end
      end

      def success
        where.not(finished_at: nil)
          .where.not(id: failed)
          .where.not(id: retried)
      end

      def scheduled
        where(finished_at: nil, scheduled_at: Time.current..)
      end

      def pending
        where(finished_at: nil, scheduled_at: ..Time.current)
          .where.not(id: failed)
      end

      def retried
        where(finished_at: ..Time.current)
          .where.not(id: failed)
          .where(
            active_job_id: SolidQueue::Job
              .select(:active_job_id)
              .group(:active_job_id)
              .having("COUNT(*) > 1")
          )
          .where.not(
            id: SolidQueue::Job
              .select("MAX(id)")
              .group(:active_job_id)
          )
      end

      def failure_rate
        success_count = success.count
        retried_count = retried.count
        failed_count = failed.count

        total = success_count + retried_count + failed_count
        return 0 if total.zero?

        (failed_count + retried_count).to_f / total * 100
      end

      def each
        super do |job|
          yield JobDecorator.new(job)
        end
      end

      def to_a
        super.map { |job| JobDecorator.new(job) }
      end
    end
  end
end
