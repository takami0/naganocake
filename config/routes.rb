Rails.application.routes.draw do


  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  namespace :public do
    get "/" => "homes#top" , as: "top"
    get "/about" => "homes#about", as: "about"
    resources :items, only: [:index, :show]

    get "/customers/my_page" => "customers#show", as: "my_page"
    resources :customers, only: [:edit, :update]
    get "/customers/quit" => "customers#quit" #退会確認画面
    patch '/customers/leave' => "customers#leave" #退会処理
  end

  # #/cart_items
  # resources :cart_items, only: [:index, :create, :update, :destroy]
  # delete "/cart_items/destroy_all" => "public/cart_items#destroy_all" #カート内商品のデータ削除（全て）
  # #/orders
  # resources :orders, only: [:new, :index, :show, :create]
  # post "/orders/confirm" => "public/orders#confirm", as: "confirm" #注文情報確認画面
  # get "/orders/complete" => "public/orders#conplete", as: "complete" #注文完了画面
  # #/addresses
  # resources :addresses, only: [:index, :create, :edit, :update, :destroy]


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    #/homes
    get "/" => "homes#top" #管理者トップページ（注文履歴一覧）
  #   #/items
    resources :items
    #/genres
    resources :genres, only: [:index, :create, :edit, :update]
  #   #/customers
    resources :customers, only: [:index, :show, :edit, :update]
  #   #/orders
  #   resources :orders, only: [:show, :update]
  #   #/orders_histories
  #   patch "/admin/orders_histories/:id" => "admin/orders_histories#update"

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
