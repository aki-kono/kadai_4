Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  #get "homes/about" => "homes#about"
  #get "homes/about" => "homes#about", as: "about"

  get "home/about" => "homes#about", as: "about"

  #resources :books
  resources :books, only: [:show, :edit, :update, :index, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  #resources :users
  resources :users, only: [:show, :edit, :update, :index, :new]
end


