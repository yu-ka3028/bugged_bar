Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get :up, to: "rails/health#show"

  # Render dynamic PWA files from app/views/pwa/*
  get :service_worker, to: "rails/pwa#service_worker"
  get :manifest, to: "rails/pwa#manifest"

  # Defines the root path route ("/")
  # root "posts#index"
  root "top#index"
end
