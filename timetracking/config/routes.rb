Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/home', to: 'site#home'

  get '/contact', to: 'site#contact'

  get '/calculator', to: 'site#calculator'
  post '/calculate', to: 'site#calculate'

  get '/projects', to: 'projects#index'

  get '/projects/new', to: 'projects#new' 

  get '/project/:id', to: 'projects#show'

  post '/projects', to: 'projects#create'

end

