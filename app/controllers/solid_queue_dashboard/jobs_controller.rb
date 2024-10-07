module SolidQueueDashboard
  class JobsController < ApplicationController
    before_action :set_jobs, only: [ :index ]
    before_action :set_job, only: [ :show, :retry ]

    def index
      @job_queue_names = SolidQueueDashboard.job_queue_names
      @job_class_names = SolidQueueDashboard.job_class_names
    end

    def show
      @job_history = SolidQueueDashboard.decorate(
        SolidQueue::Job
          .where.not(id: @job.id)
          .where(class_name: @job.class_name)
          .order(id: :desc)
          .limit(10)
      )
    end

    def retry
      @job.retry
      redirect_to @job, notice: "Job has been scheduled for retry"
    end

    private

    def set_jobs
      jobs = SolidQueue::Job.order(id: :desc)
      jobs = SolidQueueDashboard.decorate(jobs).with_status(params[:status]) if params[:status].present?
      jobs = jobs.where(class_name: params[:class_name]) if params[:class_name].present?
      jobs = jobs.where(queue_name: params[:queue_name]) if params[:queue_name].present?

      @pagination = paginate(jobs, page: params[:page].to_i, per_page: params[:per_page].to_i)
      @jobs = SolidQueueDashboard.decorate(@pagination.records)
    end

    def set_job
      @job = SolidQueueDashboard.decorate(SolidQueue::Job.find(params[:id]))
    end
  end
end
