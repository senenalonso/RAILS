class PlayersController < ApplicationController
	def index
		players = Player.all
		render json: players
	end
	def create
		# player = Player.create(name: params[:name])
		player = Player.create(player_params)
		render json: player
	end
	def show
		player = Player.find_by(id: params[:id])
		unless player
			render json: {error: "player not found"},
				status: 404
			return
		end
		render json: player
	end
	def update
		player = Player.find_by(id: params[:id])
		unless player
			render json: {error: "player not found"},
				status: 404
			return
		end
		player.update(player_params)
		render json: player
	end
	def destroy
		player = Player.find_by(id: params[:id])
		unless player
			render json: {error: "player not found"},
				status: 404
			return
		end
		player.destroy
		render json: player
	end

	def matches
		player = Player.find_by(id: params[:id])
		unless player
			render json: {error: "player not found"},
				status: 404
			return
		end
		matches = player.matches
		render json: matches
	end




	private
	def player_params
		params.permit(:name)
	end
end
