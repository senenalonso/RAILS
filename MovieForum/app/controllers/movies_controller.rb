class MoviesController < ApplicationController
	def search
		@movies = Movie.getMoviesByTitle(params[:search])
		render 'site/index'
	end

	def show
		@movie = Movie.getById(params[:id])

		if @movie
			@comments = Comment.getCommentsForMovie(@movie.id)
			render 'movies/show', layout: 'movie'
		else
			render 'site/index'
		end
		
	end
end
