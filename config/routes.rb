Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users , only: [:new, :create, :index, :login, :signup]
  resources :posts , only: [:show ]
  get "/", to: "users#index"
  get "/users/", to: "users#index"
  get "/users/:name", to: "users#name"
  get "/login", to: "users#new"
  get "/signup", to: "users#register"
  post "/login", to: "users#login", as: "perform_login"
  post "/signup", to: "users#signup", as: "perform_signup"
  
  # Defines the root path route ("/")
  # root "posts#index"
end
