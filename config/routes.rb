SolidQueueDashboard::Engine.routes.draw do
  resources :jobs, only: [ :index, :show ] do
    member do
      post :retry
    end
  end

  resources :processes, only: [ :index, :show ]

  root "dashboard#index"
end
