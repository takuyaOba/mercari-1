Rails.application.routes.draw do


  get 'purchases/index'
  get 'purchases/done'
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
    
    resources :purchase, only: [:index] do
      collection do
        get 'index', to: 'purchases#index'
        post 'pay', to: 'purchases#pay'
        get 'done', to: 'purchases#done'
      end
    end
    
  end



end
