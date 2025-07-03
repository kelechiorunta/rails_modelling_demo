Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users , only: [:new, :create, :index, :login, :signup]
  resources :posts , only: [:show ]
  resources :sessions , only: [:new, :register, :login, :signup, :destroy]
  get "/", to: "users#index"
  get "/users/", to: "users#index"
  get "/users/:name", to: "users#name"
  get "/comments/:id", to: "comments#identity" , constraints: {id: /^[A-Z]\ / } 
  get "/login", to: "sessions#new", as: "login"
  get "/signup", to: "sessions#register", as: "signup"
  post "/login", to: "sessions#login", as: "perform_login"
  post "/signup", to: "sessions#signup", as: "perform_signup"
  get "/welcome", to: "users#welcome", as: "welcome"
  
  scope module: "admin" do
    resources :comments
  end

  concern :commentable do
    resources :comments
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
