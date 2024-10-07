module SolidQueueDashboard
  class RecurringTasksController < ApplicationController
    before_action :set_recurring_tasks, only: [ :index ]
    before_action :set_recurring_task, only: [ :show, :enqueue ]

    def index
    end

    def show
    end

    def enqueue
      @recurring_task.enqueue(at: Time.current)
      redirect_to recurring_tasks_path, notice: "Recurring task enqueued"
    end

    private

    def set_recurring_tasks
      @recurring_tasks = SolidQueueDashboard.decorate(SolidQueue::RecurringTask.all)
      @recurring_tasks = @recurring_tasks.with_type(params[:type]) if params[:type].present?
      @recurring_tasks = @recurring_tasks.order(id: :desc)
      @recurring_tasks = SolidQueueDashboard.decorate(@recurring_tasks)
    end

    def set_recurring_task
      @recurring_task = SolidQueueDashboard.decorate(SolidQueue::RecurringTask.find(params[:id]))
    end
  end
end
