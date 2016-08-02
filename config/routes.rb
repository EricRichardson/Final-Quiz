Rails.application.routes.draw do
  root 'auctions#index'
  devise_for :users
  resources :auctions do
    resources :bids
  end

  resources :users, only: [:show]
end
