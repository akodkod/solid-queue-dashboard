module SolidQueueDashboard
  module JobsHelper
    def job_color(job)
      case job.status
      when SolidQueueDashboard::Job::SUCCESS
        "emerald"
      when SolidQueueDashboard::Job::RETRIED
        "amber"
      when SolidQueueDashboard::Job::FAILED
        "red"
      when SolidQueueDashboard::Job::SCHEDULED
        "cyan"
      else
        "zinc"
      end
    end

    def job_circle(job, options = {})
      color = job_color(job)
      color_class = case color
      when "emerald"
        "bg-emerald-500"
      when "amber"
        "bg-amber-500"
      when "red"
        "bg-red-500"
      when "cyan"
        "bg-cyan-500"
      else
        "bg-zinc-300"
      end

      default_classes = "inline-block size-2 rounded-full #{color_class}"
      options[:class] = [ default_classes, options[:class] ].compact.join(" ")

      content_tag(:span, "", **options)
    end

    def job_status_badge(job, options = {})
      color = job_color(job)

      badge_options = { variant: color }.merge(options)
      badge(job.status.to_s.titleize, **badge_options)
    end

    def format_failure_rate(failure_rate, options = {})
      color = case failure_rate
      when 0..1
        "text-emerald-600"
      when 1..5
        "text-amber-600"
      else
        "text-red-600"
      end

      options[:class] = [ color, options[:class] ].compact.join(" ")

      tag.span(
        number_to_percentage(failure_rate, precision: 2, strip_insignificant_zeros: true),
        **options
      )
    end

    def any_jobs_filters?
      params[:class_name].present? || params[:status].present? || @arguments_from_job.present?
    end
  end
end
