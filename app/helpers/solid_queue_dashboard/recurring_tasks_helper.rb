module SolidQueueDashboard
  module RecurringTasksHelper
    def recurring_task_color(recurring_task)
      case recurring_task.type
      when SolidQueueDashboard::RecurringTask::COMMAND
        "blue"
      when SolidQueueDashboard::RecurringTask::JOB
        "green"
      else
        "zinc"
      end
    end

    def recurring_task_circle(recurring_task, options = {})
      color = recurring_task_color(recurring_task)
      color_class = case color
      when "blue"
        "bg-blue-500"
      when "green"
        "bg-green-500"
      else
        "bg-zinc-300"
      end

      default_classes = "inline-block size-2 rounded-full #{color_class}"
      options[:class] = [ default_classes, options[:class] ].compact.join(" ")

      content_tag(:span, "", **options)
    end

    def recurring_task_type_badge(recurring_task, options = {})
      badge_variant = recurring_task_color(recurring_task)
      badge(recurring_task.type, variant: badge_variant, **options)
    end

    def any_recurring_tasks_filters?
      params[:class_name].present? || params[:queue_name].present?
    end
  end
end
