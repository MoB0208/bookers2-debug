Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about"
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
  resource :favorite, only: [:create, :destroy]
end