Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/home', to: 'site#home'

  get '/contact', to: 'site#contact'



  get '/calculator', to: 'site#calculator'
  post '/calculate', to: 'site#calculate'



  # get   '/projects', to: 'projects#index'

  # get   '/projects/new', to: 'projects#new' 

  # get   '/project/:id', to: 'projects#show'

  # post  '/projects', to: 'projects#create'

  # get   '/projects/:project_id/time_entries', to: 'time_entries#index'

  # get   '/projects/:project_id/time_entries/new', to: 'time_entries#new'

  # post  '/projects/:project_id/time_entries', to: 'time_entries#create', as: :project_time_entries

  # get   '/projects/:project_id/time_entries/:time_entry_id/edit', to: 'time_entries#edit', as: :project_time_entry_edit

  # patch '/projects/:project_id/time_entries/:time_entry_id', to: 'time_entries#update', as: :project_time_entry

  # delete '/projects/:project_id/time_entries/:time_entry_id', to: 'time_entries#delete'

  resources :projects, only: [:index, :new, :show, :create] do
    resources :time_entry, except: [:show]
  end


end

