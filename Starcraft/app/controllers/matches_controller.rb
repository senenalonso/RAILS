class MatchesController < ApplicationController
	def index
		matches = Match.all
		render json: matches
	end
	def create
		match = Match.create(match_params)
		render json: match
	end
	def show
		match = Match.find_by(id: params[:id])
		unless match
			render json: {error: "match not found"},
				status: 404
			return
		end
		render json: match
	end
	def update
		match = Match.find_by(id: params[:id])
		unless match
			render json: {error: "match not found"},
				status: 404
			return
		end
		matches.update(match_params)
		render json: match
	end
	def destroy
		match = Match.find_by(id: params[:id])
		unless match
			render json: {error: "match not found"},
				status: 404
			return
		end
		matches.destroy
		render json: match
	end



	private
	def match_params
		params.require(:match).permit(:winner, :loser, :duration, :date)
	end
end
