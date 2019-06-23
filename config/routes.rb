Rails.application.routes.draw do

  resources :likes
  root 'items#index'

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
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
      get 'second'
      get 'third'
    end
  end
  
  resources :users do

    member do
      
    end

    collection do
      get 'show_todo'
      get 'during_trading'
      get 'like_list'
      get 'under_exhibition'
      get 'sold_list'
      get 'profile'
      get 'logout_page'
      get 'payment_page'
      get 'show_notice'
      get 'personal_information'
    end
  end

end

