module SolidQueueDashboard
  module RecurringTasksHelper
    def recurring_task_circle(type, options = {})
      options[:class] = [ "circle", recurring_task_circle_class(type), options[:class] ].compact_blank.join(" ")
      tag.span("", **options)
    end

    def recurring_task_circle_class(type)
      {
        "amber": "circle-amber",
        "sky": "circle-sky",
        "zinc": "circle-zinc"
      }[RecurringTask::TYPE_COLORS[type]&.to_sym || :zinc]
    end

    def recurring_task_type_badge(type, options = {})
      options[:class] = [ "badge", recurring_task_type_badge_class(type), options[:class] ].compact_blank.join(" ")
      tag.span(type.to_s.titleize, **options)
    end

    def recurring_task_type_badge_class(type)
      {
        "amber": "badge-amber",
        "sky": "badge-sky",
        "zinc": "badge-zinc"
      }[RecurringTask::TYPE_COLORS[type]&.to_sym || :zinc]
    end

    def any_recurring_tasks_filters?
      params[:class_name].present? || params[:queue_name].present?
    end
  end
end
