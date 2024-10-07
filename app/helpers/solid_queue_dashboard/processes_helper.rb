module SolidQueueDashboard
  module ProcessesHelper
    def process_kind_circle(kind, options = {})
      options[:class] = [ "circle", process_kind_circle_class(kind), options[:class] ].compact_blank.join(" ")
      tag.span("", **options)
    end

    def process_kind_circle_class(kind)
      {
        "blue": "circle-blue",
        "green": "circle-green",
        "yellow": "circle-yellow",
        "purple": "circle-purple"
      }[Process::KIND_COLORS[kind]&.to_sym || :zinc]
    end

    def process_kind_badge(kind, options = {})
      options[:class] = [ "badge", process_kind_badge_class(kind), options[:class] ].compact_blank.join(" ")
      tag.span(kind.to_s.titleize, **options)
    end

    def process_kind_badge_class(kind)
      {
        "blue": "badge-blue",
        "green": "badge-green",
        "yellow": "badge-yellow",
        "purple": "badge-purple"
      }[Process::KIND_COLORS[kind]&.to_sym || :zinc]
    end

    def any_processes_filters?
      params[:kind].present? || params[:hostname].present?
    end
  end
end
