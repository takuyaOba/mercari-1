Rails.application.routes.draw do

devise_for :users
root 'items#index'
resources :items
resources :users
get "during_trading", to: "users#during_trading"
get "order-confirm", to: "items#order-confirm"
get "exhibition_edit", to: "items#exhibition_edit"
end
