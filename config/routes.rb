Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  get 'users/edit'
  get "home/about" => "homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  get "users/:id" => "users#show", as: :mypage
  resources :books
  resources :users, only: [:show, :index, :edit, :update]
  resources :homes, only: [:index, :show]
end
