class UsersController < ApplicationController
	def index
		@users = User.order(created_at: :desc)
											 .limit(10)
	end
	def show
		if user.present?
			@products = @user.products
			@product = Product.new
			render 'show'
		else
			render file: 'public/404.html', status: :not_found
		end
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(
			name: params[:user][:name],
			email: params[:user][:email]
			)
		@user.save

		redirect_to "/users/#{@user.id}"
	end
	def destroy
		user.destroy

		redirect_to "/users"
	end


	private 

	def user
		@user = User.find_by(id: params[:id])
	end

end
