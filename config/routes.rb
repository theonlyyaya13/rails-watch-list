Rails.application.routes.draw do
  get 'movies/index'
  get 'movies/show'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :movies, only: [:index, :show]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'lists#index'
end
