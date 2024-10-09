module SolidQueueDashboard
  module JobsHelper
    def job_status_circle(status, options = {})
      options[:class] = [ "circle", job_status_circle_class(status), options[:class] ].compact_blank.join(" ")
      tag.span("", **options)
    end

    def job_status_circle_class(status)
      {
        "green": "circle-green",
        "amber": "circle-amber",
        "red": "circle-red",
        "blue": "circle-blue",
        "sky": "circle-sky",
        "zinc": "circle-zinc",
        "indigo": "circle-indigo",
        "purple": "circle-purple"
      }[Job::STATUS_COLORS[status]&.to_sym || :zinc]
    end

    def job_status_badge(status, options = {})
      options[:class] = [ "badge", job_status_badge_class(status), options[:class] ].compact_blank.join(" ")
      tag.span(status.to_s.titleize, **options)
    end

    def job_status_badge_class(status)
      {
        "green": "badge-green",
        "amber": "badge-amber",
        "red": "badge-red",
        "blue": "badge-blue",
        "sky": "badge-sky",
        "zinc": "badge-zinc",
        "indigo": "badge-indigo",
        "purple": "badge-purple"
      }[Job::STATUS_COLORS[status]&.to_sym || :zinc]
    end

    def format_failure_rate(failure_rate, options = {})
      badge_variant = case failure_rate
      when 0..1
        "badge-emerald"
      when 1..5
        "badge-amber"
      else
        "badge-red"
      end

      options[:class] = [ "badge", badge_variant, options[:class] ].compact_blank.join(" ")
      tag.span(number_to_percentage(failure_rate, precision: 2, strip_insignificant_zeros: true), **options)
    end

    def any_jobs_filters?
      params[:class_name].present? || params[:status].present? || params[:queue_name].present?
    end
  end
end
