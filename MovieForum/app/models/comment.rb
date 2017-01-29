class Comment < ApplicationRecord
	belongs_to :movie

	def self.getCommentsForMovie(id)
		where('movie_id = ?', id)		
	end
end
