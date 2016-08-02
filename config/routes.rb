Rails.application.routes.draw do
  root 'auctions#index'
  devise_for :users
  resources :auctions do
    resources :bids
  end

  resources :users, only: [:show]
  patch '/auctions/:id/publish' => 'auctions#publish', as: :publish
  patch '/auctions/:id/cancel' => 'auctions#cancel', as: :cancel
end
