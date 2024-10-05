# frozen_string_literal: true

begin
  require "rails"
rescue LoadError
  raise "SolidQueueDashboard requires Rails"
end

require_relative "solid_queue_dashboard/version"
require_relative "solid_queue_dashboard/configuration"
require_relative "solid_queue_dashboard/engine"

module SolidQueueDashboard
  class Error < StandardError; end
end
