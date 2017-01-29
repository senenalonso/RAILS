Rails.application.routes.draw do
	get 	'/', 															to: 'site#index', 			as: :home 
	post 	'/search', 												to: 'movies#search', 		as: :search_movies
	get 	'/movies/:id', 										to: 'movies#show', 			as: :movies
	post 	'/movies/:id/comment', 						to: 'comments#create', 	as: :comments
end
