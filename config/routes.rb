Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :artists, only: [:show]
  resources :events
  resources :attendees, only: [:create, :destroy]
  resources :clubs, only: [:show]
end
