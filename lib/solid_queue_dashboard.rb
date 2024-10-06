# frozen_string_literal: true

require "rails"
require_relative "solid_queue_dashboard/version"
require_relative "solid_queue_dashboard/configuration"
require_relative "solid_queue_dashboard/engine"
require_relative "solid_queue_dashboard/job"
require_relative "solid_queue_dashboard/process"
require_relative "solid_queue_dashboard/decorators/job_decorator"
require_relative "solid_queue_dashboard/decorators/jobs_decorator"
require_relative "solid_queue_dashboard/decorators/process_decorator"
require_relative "solid_queue_dashboard/decorators/processes_decorator"

module SolidQueueDashboard
  class Error < StandardError; end

  def self.queue_names
    SolidQueue::Job.distinct.pluck(:queue_name)
  end

  def self.class_names
    SolidQueue::Job.distinct.pluck(:class_name)
  end

  def self.decorate(object)
    case object
    when SolidQueue::Job
      Decorators::JobDecorator.new(object)
    when SolidQueue::Job.const_get(:ActiveRecord_Relation)
      Decorators::JobsDecorator.new(object)
    when SolidQueue::Process
      Decorators::ProcessDecorator.new(object)
    when SolidQueue::Process.const_get(:ActiveRecord_Relation)
      Decorators::ProcessesDecorator.new(object)
    else
      raise Error, "Cannot decorate #{object.class}"
    end
  end
end
