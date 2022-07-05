Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  
  get 'homes/top'
  get 'homes/about'
  
  resources :addresses, only: [:index, :edit]
  resources :orders, only: [:new, :index, :show]
  get 'orders/complete'
  resources :cart_items, only: [:index]
  resources :customers, only: [:show, :edit, :update]
  get 'customers/quit'
  get 'customers/leave'
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
  resources :items, only: [:index, :show]
  
  
  namespace :admin do
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit]
    resources :genres, only: [:index, :edit]
    resources :items, only: [:index, :new, :show, :edit]
    resources :sessions, only: [:new]
    get 'homes/top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
