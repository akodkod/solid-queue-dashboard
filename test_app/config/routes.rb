Rails.application.routes.draw do
  mount SolidQueueDashboard::Engine, at: "/solid-queue-dashboard"

  get "up", to: "rails/health#show", as: :rails_health_check
end
