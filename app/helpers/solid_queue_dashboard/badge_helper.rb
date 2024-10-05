module SolidQueueDashboard
  module BadgeHelper
    def badge(content = nil, options = {}, &block)
      variant = options.delete(:variant) || "default"

      base_classes = "inline-flex items-center gap-x-1.5 rounded-md px-1.5 py-0.5 text-sm/5 font-medium sm:text-xs/5 forced-colors:outline"

      variant_classes = case variant
      when "default"
        "bg-primary/15 text-primary dark:bg-primary/10 dark:text-primary-foreground"
      when "secondary"
        "bg-secondary/15 text-secondary-foreground dark:bg-secondary/10 dark:text-secondary-foreground"
      when "destructive"
        "bg-destructive/15 text-destructive dark:bg-destructive/10 dark:text-destructive-foreground"
      when "outline"
        "bg-background/15 text-foreground dark:bg-foreground/10 dark:text-background"
      when "red"
         "bg-red-500/15 text-red-700 dark:bg-red-500/10 dark:text-red-400"
      when "orange"
         "bg-orange-500/15 text-orange-700 dark:bg-orange-500/10 dark:text-orange-400"
      when "amber"
        "bg-amber-400/20 text-amber-700 dark:bg-amber-400/10 dark:text-amber-400"
      when "yellow"
         "bg-yellow-400/20 text-yellow-700 dark:bg-yellow-400/10 dark:text-yellow-300"
      when "lime"
         "bg-lime-400/20 text-lime-700 dark:bg-lime-400/10 dark:text-lime-300"
      when "green"
         "bg-green-500/15 text-green-700 dark:bg-green-500/10 dark:text-green-400"
      when "emerald"
         "bg-emerald-500/15 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400"
      when "teal"
         "bg-teal-500/15 text-teal-700 dark:bg-teal-500/10 dark:text-teal-300"
      when "cyan"
         "bg-cyan-400/20 text-cyan-700 dark:bg-cyan-400/10 dark:text-cyan-300"
      when "sky"
         "bg-sky-500/15 text-sky-700 dark:bg-sky-500/10 dark:text-sky-300"
      when "blue"
         "bg-blue-500/15 text-blue-700 dark:text-blue-400"
      when "indigo"
         "bg-indigo-500/15 text-indigo-700 dark:text-indigo-400"
      when "violet"
         "bg-violet-500/15 text-violet-700 dark:text-violet-400"
      when "purple"
         "bg-purple-500/15 text-purple-700 dark:text-purple-400"
      when "fuchsia"
         "bg-fuchsia-400/15 text-fuchsia-700 dark:bg-fuchsia-400/10 dark:text-fuchsia-400"
      when "pink"
         "bg-pink-400/15 text-pink-700 dark:bg-pink-400/10 dark:text-pink-400"
      when "rose"
         "bg-rose-400/15 text-rose-700 dark:bg-rose-400/10 dark:text-rose-400"
      when "zinc"
         "bg-zinc-600/10 text-zinc-700 dark:bg-white/5 dark:text-zinc-400"
      else
        raise "Invalid variant: #{variant}"
      end

      classes = [ base_classes, variant_classes, options[:class] ].compact.join(" ")
      options[:class] = classes

      if block_given?
        content = capture(&block)
      end

      tag.div(content, **options)
    end
  end
end
