module SolidQueueDashboard
  module ButtonHelper
    def button(content = nil, options = {}, &block)
      render_button_or_link(:button, content, options, &block)
    end

    def button_link(content = nil, options = {}, &block)
      render_button_or_link(:a, content, options, &block)
    end

    private

    def render_button_or_link(tag_type, content = nil, options = {}, &block)
      variant = options.delete(:variant) || "default"
      size = options.delete(:size) || "default"

      base_classes = "inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50"

      variant_classes = case variant
      when "default"
        "bg-primary text-primary-foreground hover:bg-primary/90"
      when "destructive"
        "bg-destructive text-destructive-foreground hover:bg-destructive/90"
      when "outline"
        "border border-input bg-background hover:bg-accent hover:text-accent-foreground"
      when "secondary"
        "bg-secondary text-secondary-foreground hover:bg-secondary/80"
      when "ghost"
        "hover:bg-accent hover:text-accent-foreground"
      when "link"
        "text-primary underline-offset-4 hover:underline"
      else
        raise "Invalid variant: #{variant}"
      end

      size_classes = case size
      when "default"
        "h-10 px-4 py-2"
      when "xs"
        "h-7 rounded-md px-2"
      when "sm"
        "h-9 rounded-md px-3"
      when "lg"
        "h-11 rounded-md px-8"
      when "icon"
        "h-10 w-10"
      else
        raise "Invalid size: #{size}"
      end

      classes = [ base_classes, variant_classes, size_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      if block_given?
        content = capture(&block)
      end

      tag.send(tag_type, content, **options)
    end
  end
end
