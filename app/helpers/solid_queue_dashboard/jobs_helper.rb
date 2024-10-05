module SolidQueueDashboard
  module JobsHelper
    def job_id(job)
      status = job_status(job)
      badge_variant = case status
      when SolidQueueDashboard::Job::FINISHED
        "bg-emerald-500"
      when SolidQueueDashboard::Job::FAILED
        "bg-red-500"
      when SolidQueueDashboard::Job::SCHEDULED
        "bg-amber-500"
      else
        "bg-zinc-300"
      end

      circle = content_tag(:span, "", class: "inline-block w-2 h-2 mr-2 rounded-full #{badge_variant}")
      content_tag(:span, circle + job.id.to_s, class: "inline-flex items-center")
    end

    def job_status(job)
      SolidQueueDashboard::Job.status(job)
    end

    def job_status_badge(job)
      status = job_status(job)
      badge_variant = case status
      when SolidQueueDashboard::Job::FINISHED
        "emerald"
      when SolidQueueDashboard::Job::FAILED
        "red"
      when SolidQueueDashboard::Job::SCHEDULED
        "amber"
      else
        "zinc"
      end

      badge(status, variant: badge_variant)
    end

    def job_queue_name(job)
      job.queue_name.titleize
    end

    def job_error_message(job)
      failed_execution = job.failed_execution
      return unless failed_execution

      "#{failed_execution.error['exception_class']}: #{failed_execution.error['message']}"
    end
  end
end
