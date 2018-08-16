Rails.application.routes.draw do
  root "static_pages#home"

  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    member do
      get :following
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  namespace :admin do
    resources :restaurants, only: :index
    resources :users, except: :show
  end
  namespace :manager do
    resources :restaurants, except: :destroy
  end
  resources :restaurants do
    resources :suggests
    member do
      get :followers
    end
  end

  resources :foods do
    resources :images
  end

  resources :relationships, only: [:create, :destroy]

  get "/search", to: "search#index"
  get "/restaurants/:city", to: "restaurants#index"
  get "/foods/:category", to: "foods#index"
end
