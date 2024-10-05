module SolidQueueDashboard
  class JobsController < ApplicationController
    before_action :set_jobs, only: [ :index ]
    before_action :set_job, only: [ :show, :retry ]

    def index
      @unique_class_names = SolidQueue::Job.distinct.pluck(:class_name)
    end

    def show
      @job_history = SolidQueue::Job
        .where(class_name: @job.class_name)
        .order(id: :desc)

      @execution_history = SolidQueueDashboard::Job
        .with_arguments_from_job(@job_history, @job)
        .order(id: :desc)
    end

    def retry
      # @job.retry
      redirect_to job, notice: "Job has been retried"
    end

    private

    def set_jobs
      @jobs = SolidQueueDashboard::Job.with_status(SolidQueue::Job.all, params[:status])
      @jobs = @jobs.where(class_name: params[:class_name]) if params[:class_name].present?

      @arguments_from_job = SolidQueue::Job.find(params[:arguments_from_id]) if params[:arguments_from_id].present?
      @jobs = SolidQueueDashboard::Job.with_arguments_from_job(@jobs, @arguments_from_job)

      @jobs = @jobs.order(id: :desc)
    end

    def set_job
      @job = SolidQueue::Job.find(params[:id])
      @job_status = SolidQueueDashboard::Job.status(@job)
    end
  end
end
