Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :matches, except: [:new, :edit]
  resources :players, except: [:new, :edit]

  get '/player/:id/matches', to: 'player#matches' 
end
