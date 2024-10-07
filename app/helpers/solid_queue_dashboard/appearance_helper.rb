module SolidQueueDashboard
  module AppearanceHelper
    def dark_mode?
      cookies[:dark_mode] == "true"
    end
  end
end
