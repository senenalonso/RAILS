Rails.application.routes.draw do
  
  get '/contacts', to: 'contacts#index'

  get '/contacts/new', to: 'contacts#new' 

  get '/contact/:id', to: 'contacts#show'

  post '/contacts', to: 'contacts#create'

  post '/contacts/favorite', to: 'contacts#favorite'

end
