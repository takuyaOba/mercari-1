Rails.application.routes.draw do

  root 'items#index'

  #いいね機能
  post "likes/:item_id/create" => "likes#create"
  delete "likes/:item_id/create" => "likes#destory"
 
  #flag機能
  get "flags/:item_id/new" => "flags#new"
  post "flags/:item_id/create" => "flags#create"

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
  end

  resources :items do
    member do
      get 'exhibition_edit'
      get 'order_confirm'
    end

    collection do
      get 'under_exhibition'
      get 'second'
      get 'third'
    end

  end
  
  resources :users do
    collection do
      get 'show_todo'
      get 'during_trading'
      get 'like_list'
      get 'sold_list'
      get 'profile'
      get 'logout_page'
      get 'payment_page'
      get 'show_notice'
      get 'personal_information'
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

