module SolidQueueDashboard
  class ApplicationController < ActionController::Base
    include SolidQueueDashboard::PaginationHelper

    layout "solid_queue_dashboard/application"
  end
end
