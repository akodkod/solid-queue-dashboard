module SolidQueueDashboard
  class RecurringTasksController < ApplicationController
    before_action :set_recurring_tasks, only: [ :index ]
    before_action :set_recurring_task, only: [ :show ]

    def index
    end

    def show
    end

    private

    def set_recurring_tasks
      @recurring_tasks = SolidQueue::RecurringTask.all
      @recurring_tasks = @recurring_tasks.where(class_name: params[:class_name]) if params[:class_name].present?
      @recurring_tasks = @recurring_tasks.where(queue_name: params[:queue_name]) if params[:queue_name].present?
      @recurring_tasks = @recurring_tasks.order(id: :desc)
      @recurring_tasks = SolidQueueDashboard.decorate(@recurring_tasks)
    end

    def set_recurring_task
      @recurring_task = SolidQueueDashboard.decorate(SolidQueue::RecurringTask.find(params[:id]))
    end
  end
end
