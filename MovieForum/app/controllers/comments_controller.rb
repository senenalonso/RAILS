class CommentsController < ApplicationController
	def create
		 @movie = Movie.getById(params[:id])

		comment = Comment.new(
						user: params[:user],
						text: params[:commentText],
						movie_id: @movie.id
			)
		comment.save

		@comments = Comment.getCommentsForMovie(@movie.id)

		redirect_to movies_path
		
	end
end
