Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/home', to: 'site#home'

  get '/contact', to: 'site#contact'

  get '/calculator', to: 'site#calculator'
  post '/calculate', to: 'site#calculate'


  get '/projects', to: 'projects#index'

<<<<<<< HEAD
  get '/projects/new', to: 'projects#new' 

  get '/project/:id', to: 'projects#show'

  post '/projects', to: 'projects#create'

=======
>>>>>>> a7ae43eb209a92e74d12611c0b605dd24660452f
end
