module SolidQueueDashboard
  module DescriptionListHelper
    def description_list(content = nil, options = {}, &block)
      base_classes = "grid grid-cols-1 text-base/6 sm:grid-cols-2"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.dl(content, **options)
    end

    def description_list_term(content = nil, options = {}, &block)
      base_classes = "col-start-1 border-t border-zinc-950/5 pt-3 text-zinc-500 first:border-none sm:border-0 sm:py-3 dark:border-white/5 dark:text-zinc-400"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.dt(**options) do
        tag.div(class: "flex items-center gap-1") do
          concat(content)
          concat(tag.span(class: "mx-2 mt-px hidden h-px flex-1 bg-zinc-950/10 dark:border-white/10 sm:block translate-y-px"))
        end
      end
    end

    def description_list_details(content = nil, options = {}, &block)
      base_classes = "font-medium pb-3 pt-1 text-zinc-950 sm:border-0 sm:border-zinc-950/5 sm:py-3 dark:text-white dark:sm:border-white/5 sm:[&:nth-child(2)]:border-none"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.dd(content, **options)
    end
  end
end
