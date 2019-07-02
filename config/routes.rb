Rails.application.routes.draw do

  root 'items#index'

  #いいね機能
  post "likes/:item_id/create", to:"likes#create"
  delete "likes/:item_id/create", to:"likes#destory"
 
  #flag機能
  get "flags/:item_id/new", to: "flags#new"
  post "flags/:item_id/create", to: "flags#create"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    omniauth_callbacks: 'users/omniauth_callbacks',
  },
                     skip: %i[sessions registrations]
  as :user do
    # ログイン
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    # ログアウト
    delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
    # サインアップ
    get 'signup' => 'users/registrations#signup'
    get "/signup/registration" => "users/registrations#new"
    post "signup/address" => "users/registrations#address"
    post "signup/credit" => "users/registrations#credit"
    post "/signup/completed" => "users/registrations#create"
    get "/signup/done" => "users/registrations#done"
    get "signup/credit_new" => "users/registrations#credit_new"
  end

  resources :items do
    member do
      get 'under_exhibition'
      get 'exhibition_edit'
      get 'order_confirm'
    end

    collection do
     
      get 'second'
      get 'third'
      get 'item_search'
      get "item_search1"
    end

  end
  
  #マイページからのリンク一覧
  resources :users do
    member do
      get 'show_notice'
      get 'show_todo'
      get 'during_trading'
      get 'like_list'
      get 'sold_list'
      get 'profile'
      get 'payment_page'
      post 'delete', to: 'cards#delete'
      get 'personal_information'
      get 'logout_page'
    end
  end

  resources :item_images, only: [:index]

  resources :cards do
    member do
      post 'delete'
    end
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
      post "new" , to: "cards#new"
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index/items/:id', to: 'purchases#index'
      post 'pay/items/:id', to: 'purchases#pay'
      get 'done/items', to: 'purchases#done'
    end
  end
end

