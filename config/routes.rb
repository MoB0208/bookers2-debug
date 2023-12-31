Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users

  root to: "homes#top"
  get "home/about" => "homes#about"
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end