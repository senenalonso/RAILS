class Movie < ApplicationRecord
	has_attached_file :poster, styles: {:medium=>"300x300>", :thumb =>"100x100>"}
	validates_attachment_content_type :poster, :content_type => /\Aimage\/.+\z/
	has_many :comments

	def self.getMoviesByTitle(title)
		@movies = where('title like ?', "%#{title}%")	

		if @movies.empty?
			@list_imdb = Imdb::Search.new(title).movies
			@movies = @list_imdb.select {|m| m.title.include?(title)}
		end
		@movies
	end	

	def self.getById(id)
		@movie = find_by(id: id)

		if !@movie
			@movie_imdb = Imdb::Movie.new(id)
			@movie = save_movie_in_db(@movie_imdb)
		end
		@movie
	end	

	private

	def self.save_movie_in_db(movie)
		m=Movie.new(
						title: movie.title,
						year: movie.year,
						plot: movie.plot
			)
		m.save
		m
	end
end
