module SolidQueueDashboard
  module ApplicationHelper
    def empty_value
      tag.span("—", class: "text-muted-foreground/30")
    end
  end
end
