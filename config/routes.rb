Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  get "dashboard", to: "pages#dashboard", as: :dashboard
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events do
    resources :posts, only: [:show, :create]
  end
  resources :posts, only: [] do
    resources :comments, only: [:create]
  end
  resources :artists, only: [:show]
  resources :attendees, only: [:create, :destroy]
  resources :clubs, only: [:show]
end
