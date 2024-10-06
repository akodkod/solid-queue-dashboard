module SolidQueueDashboard
  module NavbarHelper
    def navbar(options = {}, &block)
      tag_type = options.delete(:tag) || :nav

      base_classes = "flex items-center gap-4 bg-background py-4"

      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.send(tag_type, **options) do
        content
      end
    end

    def navbar_item(content = nil, options = {}, &block)
      variant = options.delete(:variant) || "default"

      base_classes = "inline-flex items-center rounded-md justify-center px-3 py-2 text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"

      variant_classes = case variant
      when "default"
        "text-foreground hover:bg-accent hover:text-accent-foreground"
      when "active"
        "bg-accent text-accent-foreground"
      end

      classes = [ base_classes, variant_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      if block_given?
        content = capture(&block)
      end

      tag.a(content, **options)
    end
  end
end
