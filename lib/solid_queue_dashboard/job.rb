module SolidQueueDashboard
  module Job
    # Constants
    FINISHED = "Finished"
    FAILED = "Failed"
    SCHEDULED = "Scheduled"
    PENDING = "Pending"

    STATUSES = [FINISHED, FAILED, SCHEDULED, PENDING]

    def self.status(job)
      if finished?(job)
        FINISHED
      elsif failed?(job)
        FAILED
      elsif scheduled?(job)
        SCHEDULED
      else
        PENDING
      end
    end

    def self.finished?(job)
      job.finished_at.present?
    end

    def self.failed?(job)
      job.failed_execution.present?
    end

    def self.scheduled?(job)
      job.scheduled_at.present? && job.scheduled_at > Time.current
    end

    def self.with_status(scope, status)
      return scope if status.blank?

      case params[:status]
      when SolidQueueDashboard::Job::FINISHED
        scope.finished
      when SolidQueueDashboard::Job::FAILED
        scope.failed
      when SolidQueueDashboard::Job::SCHEDULED
        scope.where(finished_at: nil, scheduled_at: Time.current..)
      when SolidQueueDashboard::Job::PENDING
        scope.where(finished_at: nil, scheduled_at: ..Time.current)
      else
        raise "Invalid status: #{status}"
      end
    end

    def self.with_arguments_from_job(scope, arguments_from_job)
      return scope if arguments_from_job.blank?

      scope.where("arguments LIKE ?", "%#{arguments_from_job.arguments["arguments"].to_json}%")
    end
  end
end
