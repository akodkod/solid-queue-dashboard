SolidQueueDashboard::Engine.routes.draw do
  resources :jobs, only: [ :index, :show ] do
    member do
      post :retry
    end
  end

  resources :processes, only: [ :index, :show ]

  resources :recurring_tasks, path: "recurring-tasks", only: [ :index, :show ] do
    member do
      post :enqueue
    end
  end

  post "appearance/toggle", to: "appearance#toggle", as: :toggle_appearance
  root "dashboard#index"
end
