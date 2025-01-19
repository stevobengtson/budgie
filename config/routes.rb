Rails.application.routes.draw do
  # User authentication
  resource :session
  resource :registration, only: %i[new create]
  resources :passwords, param: :token

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, except: [ :show ]
  resources :category_groups, except: [ :index, :show ]
  resources :accounts, except: [ :show ]
  resources :transactions, except: [ :show ]
  # resources :budgets, only: [ :index ]

  get "budgets" => "budgets#index", as: :budgets
  get "budgets/:date" => "budgets#index", as: :budgets_month

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/budgets")
  root "transactions#index"
end
