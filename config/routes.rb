Rails.application.routes.draw do

devise_for :users
root 'items#index'
resources :items
resources :users

resources :categorys
  get "order-confirm" => 'items#order-confirm'
end
