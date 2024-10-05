SolidQueueDashboard::Engine.routes.draw do
  resources :jobs, only: [:index, :show] do
    member do
      post :retry
    end
  end

  root "dashboard#index"
end
