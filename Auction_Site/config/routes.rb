Rails.application.routes.draw do
  resources :users do
    resources :products, only: [:index, :show, :update]
  end

  resources :products, except: [:index] do
    resources :bids, only: [:create]
  	end
end
