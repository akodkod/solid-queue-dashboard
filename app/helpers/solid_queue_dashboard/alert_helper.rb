module SolidQueueDashboard
  module AlertHelper
    def alert(options = {}, &block)
      base_classes = "relative w-full rounded-lg border p-4 [&>svg~*]:pl-7 [&>svg+div]:translate-y-[-3px] [&>svg]:absolute [&>svg]:left-4 [&>svg]:top-4 [&>svg]:text-foreground"
      variant = options.delete(:variant) || "default"

      variant_classes = case variant
      when "default"
        "bg-background text-foreground"
      when "destructive"
        "border-destructive/50 text-destructive dark:border-destructive [&>svg]:text-destructive"
      when "red"
        "border-red-500/50 text-red-700 dark:border-red-500 dark:text-red-300 [&>svg]:text-red-500"
      when "green"
        "border-green-500/50 text-green-700 dark:border-green-500 dark:text-green-300 [&>svg]:text-green-500"
      when "yellow"
        "border-yellow-500/50 text-yellow-700 dark:border-yellow-500 dark:text-yellow-300 [&>svg]:text-yellow-500"
      when "blue"
        "border-blue-500/50 text-blue-700 dark:border-blue-500 dark:text-blue-300 [&>svg]:text-blue-500"
      when "purple"
        "border-purple-500/50 text-purple-700 dark:border-purple-500 dark:text-purple-300 [&>svg]:text-purple-500"
      when "pink"
        "border-pink-500/50 text-pink-700 dark:border-pink-500 dark:text-pink-300 [&>svg]:text-pink-500"
      else
        raise "Invalid variant: #{variant}"
      end

      classes = [ base_classes, variant_classes, options[:class] ].compact.join(" ")
      options[:class] = classes
      options[:role] = "alert"

      content = capture(&block) if block_given?

      tag.div(**options) { content }
    end

    def alert_title(content = nil, options = {}, &block)
      base_classes = "mb-1 font-medium leading-none tracking-tight"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.h5(content, **options)
    end

    def alert_description(options = {}, &block)
      base_classes = "text-sm [&_p]:leading-relaxed"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.div(**options) { content }
    end
  end
end
