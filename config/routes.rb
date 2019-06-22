Rails.application.routes.draw do

  devise_for :users
  resources :likes
  root 'items#index'

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

