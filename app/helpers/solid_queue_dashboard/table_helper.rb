module SolidQueueDashboard
  module TableHelper
    def table(options = {}, &block)
      base_classes = "w-full caption-bottom text-sm"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.div(class: "relative w-full overflow-auto") do
        tag.table(**options) { content }
      end
    end

    def table_header(options = {}, &block)
      base_classes = "[&_tr]:border-b"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.thead(**options) { content }
    end

    def table_body(options = {}, &block)
      base_classes = "[&_tr:last-child]:border-0"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.tbody(**options) { content }
    end

    def table_footer(options = {}, &block)
      base_classes = "border-t bg-muted/50 font-medium [&>tr]:last:border-b-0"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.tfoot(**options) { content }
    end

    def table_row(options = {}, &block)
      base_classes = "border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.tr(**options) { content }
    end

    def table_head(content = nil, options = {}, &block)
      base_classes = "h-12 px-4 text-left align-middle font-medium text-muted-foreground whitespace-nowrap [&:has([role=checkbox])]:pr-0"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.th(content, **options)
    end

    def table_cell(content = nil, options = {}, &block)
      base_classes = "p-4 align-middle [&:has([role=checkbox])]:pr-0"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.td(content, **options)
    end

    def table_caption(content = nil, options = {}, &block)
      base_classes = "mt-4 text-sm text-muted-foreground"
      classes = [ base_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      content = capture(&block) if block_given?

      tag.caption(content, **options)
    end
  end
end
