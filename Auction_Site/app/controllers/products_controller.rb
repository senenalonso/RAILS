class ProductsController < ApplicationController
	include ApplicationHelper

	def index
		@products = user.products
	end

	def new
		@product = user.products.new
	end

	def show
		if product.present? && params[:user_id].present?			
			render 'edit'
		elsif product.present? 
			@bid = Bid.new
			bid_history
			render 'show'
		else
			render file: 'public/404.html', status: :not_found
		end
	end

	def create
		@product = user.products.new(
								title: params[:product][:title],
								description: params[:product][:description],
								deadline: params[:product][:deadline]
							)
		if @product.save
			message("Product created successfully", 0) 
			redirect_to "/users/#{user.id}"
		else 
			message("Ups!! Try again!!", 0) 
			render 'new'
		end
	end

	def edit
		product
	end
	
	def update
		if product.update(product_params)			
			message("Product updated successfully", 0) 
			redirect_to "/users/#{user.id}"
		else 
			message("Ups!! Try again!!", 0) 
			render 'edit'
		end
	end

	def delete
		product.delete
		redirect_to "/users/#{user.id}"		
	end


	private

	def user
		@user = User.find(params[:user_id])
	end

	def product
		if params[:user_id].present?
			@product = user.products.find(params[:id])
		else
			@product = Product.find(params[:id])
		end
	end

	def product_params
		params.require(:product).permit(:title, :description, :deadline)
	end

	def bid_history
		bids = product.bids.all.order(amount: :desc)
		binding.pry
		@bid_history = bids.map { |b|	{"amount": b.amount, "user":User.getNameById(b.user_id)}  }
	end
end
