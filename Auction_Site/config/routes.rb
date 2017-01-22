Rails.application.routes.draw do

	get '/home', to: 'site#home'

  resources :users do
    resources :products
  end

  post '/users/login', to: 'users#login', as: :user_login 


  resources :products, except: [:index] do
    resources :bids, only: [:create]
  	end
end
