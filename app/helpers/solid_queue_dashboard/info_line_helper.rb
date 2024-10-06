module SolidQueueDashboard
  module InfoLineHelper
    def info_line(content = nil, options = {}, &block)
      base_classes = "flex items-center gap-4"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.div(content, **options)
    end

    def info_line_label(content = nil, options = {}, &block)
      base_classes = "text-zinc-500 whitespace-nowrap"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.div(content, **options)
    end

    def info_line_separator(content = nil, options = {}, &block)
      base_classes = "h-px flex-1 bg-zinc-950/10 dark:border-white/10 translate-y-px"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.div(content, **options)
    end

    def info_line_value(content = nil, options = {}, &block)
      base_classes = "font-medium text-right text-zinc-950 dark:text-white"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.div(content, **options)
    end
  end
end
