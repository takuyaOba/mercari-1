Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  resources :items do
    member do
      get 'exhibition_edit'
      get 'order_confirm'
    end
  end
  resources :users do
    member do
      get 'during_trading'
    end
  end

end
