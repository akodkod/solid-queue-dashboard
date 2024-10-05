module SolidQueueDashboard
  class Engine < ::Rails::Engine
    isolate_namespace SolidQueueDashboard

    initializer "solid_queue_dashboard.assets.precompile" do |app|
      app.config.assets.precompile += %w[
        solid_queue_dashboard/application.js
        solid_queue_dashboard/application.css
      ]
    end
  end
end
