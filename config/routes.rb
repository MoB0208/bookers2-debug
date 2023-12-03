Rails.application.routes.draw do
  devise_for :users

  get 'favorites/create'
  get 'favorites/destroy'
  
  root to: "homes#top"
  get "home/about" => "homes#about"
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end
end