module SolidQueueDashboard
  class ProcessesController < ApplicationController
    before_action :set_processes, only: [ :index ]
    before_action :set_process, only: [ :show ]

    def index
      @unique_kinds = SolidQueueDashboard::Process::KINDS
      @unique_hostnames = SolidQueue::Process.distinct.pluck(:hostname)
    end

    def show
    end

    private

    def set_processes
      @processes = SolidQueue::Process.all
      @processes = @processes.where(kind: params[:kind]) if params[:kind].present?
      @processes = @processes.where(hostname: params[:hostname]) if params[:hostname].present?
      @processes = @processes.order(id: :desc)
      @processes = SolidQueueDashboard.decorate(@processes)
    end

    def set_process
      @process = SolidQueueDashboard.decorate(SolidQueue::Process.find(params[:id]))
    end
  end
end
