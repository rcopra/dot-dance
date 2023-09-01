Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "search", to: "pages#search", as: :search
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events do
    resources :posts, only: [:index, :show, :create]
    resources :attendees, only: [:create, :destroy]
  end
  resources :posts, only: [] do
    resources :comments, only: [:create]
  end
  resources :artists, only: [:show]
  resources :clubs, only: [:show]
end
