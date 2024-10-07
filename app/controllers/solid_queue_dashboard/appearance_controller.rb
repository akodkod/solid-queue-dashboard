module SolidQueueDashboard
  class AppearanceController < ApplicationController
    def toggle
      cookies[:dark_mode] = cookies[:dark_mode] == "false" ? "true" : "false"
      redirect_to request.referer
    end
  end
end
