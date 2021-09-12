Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :destroy, :show, :edit, :update]
  resources :books, only: [:new, :save, :create, :index, :destroy, :show, :edit, :update]
  root to: 'homes#top'
  get "home/about" => "homes#about"
end