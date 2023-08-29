Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :artists, only: [:show]
  resources :attendees, only: [:create, :destroy]
  resources :clubs, only: [:show]
end
