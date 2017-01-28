Rails.application.routes.draw do
	get 	'/', 						to: 'site#index', 		as: :home 
	post 	'/search', 			to: 'movies#search', 	as: :search_movies
	get 	'/movies/:id', 	to: 'movies#show', 		as: :movies
end
