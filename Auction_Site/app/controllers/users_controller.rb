class UsersController < ApplicationController
	include ApplicationHelper

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

		redirect_to users_path(@user)
	end
	def destroy
		user.destroy

		redirect_to users_path
	end

	def login
		user = User.checkUser?(params[:email],params[:password])
		if user
			session[:user_id] = user
			redirect_to "/users"
		else
			message("Invalid email or password!!",0)
			redirect_to home_path
		end
	end


	private 

	def user
		@user = User.find_by(id: params[:id])
	end

	def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
