module SolidQueueDashboard
  module ProcessesHelper
    def process_color(process)
      case process.kind
      when SolidQueueDashboard::Process::SUPERVISOR
        "blue"
      when SolidQueueDashboard::Process::DISPATCHER
        "purple"
      when SolidQueueDashboard::Process::WORKER
        "green"
      when SolidQueueDashboard::Process::SCHEDULER
        "amber"
      else
        "zinc"
      end
    end

    def process_circle(process, options = {})
      color = process_color(process)
      color_class = case color
      when "blue"
        "bg-blue-500"
      when "purple"
        "bg-purple-500"
      when "green"
        "bg-green-500"
      when "amber"
        "bg-amber-500"
      else
        "bg-zinc-300"
      end

      default_classes = "inline-block size-2 rounded-full #{color_class}"
      options[:class] = [ default_classes, options[:class] ].compact.join(" ")

      content_tag(:span, "", **options)
    end

    def process_kind_badge(process, options = {})
      badge_variant = process_color(process)
      badge(process.kind, variant: badge_variant, **options)
    end

    def any_processes_filters?
      params[:kind].present? || params[:hostname].present?
    end
  end
end
