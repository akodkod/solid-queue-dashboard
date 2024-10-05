module SolidQueueDashboard
  module CardHelper
    def card(options = {}, &block)
      base_classes = "rounded-lg border bg-card text-card-foreground shadow-sm"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.div(**options) { content }
    end

    def card_header(options = {}, &block)
      base_classes = "flex flex-col space-y-1.5 p-6"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.div(**options) { content }
    end

    def card_title(content = nil, options = {}, &block)
      base_classes = "text-2xl font-semibold leading-none tracking-tight"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.h3(content, **options)
    end

    def card_description(content = nil, options = {}, &block)
      base_classes = "text-sm text-muted-foreground"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.p(content, **options)
    end

    def card_content(options = {}, &block)
      base_classes = "p-6 pt-0"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.div(**options) { content }
    end

    def card_footer(options = {}, &block)
      base_classes = "flex items-center p-6 pt-0"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.div(**options) { content }
    end
  end
end
