Rails.application.routes.draw do
  root 'auctions#new'
  devise_for :users
  resources :auctions do
    resources :bids
  end
end
