Rails.application.routes.draw do

devise_for :users
root 'items#index'
resources :items
resources :users
get "order-confirm", to: "items#order-confirm"
end
