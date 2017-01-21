class BidsController < ApplicationController
	include ApplicationHelper
	def create
		user = User.getIdByEmail(params[:email])
		product = Product.find(params[:product_id])
		if user.present?
			if params[:bid][:amount].to_i > getMaxBidForProduct(product)
				
				@bid = product.bids.new(
								amount: params[:bid][:amount],
								user_id: user,
								product_id: params[:id]
								)

				if @bid.save
					message("Bid sent successfully", 0) 
					redirect_to product_path(product)
				else 
					message("Ups!! Try again!!", 0) 
					message(@bid.errors[:bid][0], 0)
					redirect_to product_path(product)
				end
			else
				message("Ups!! There is a better bid!!! You must to make a higher bid!!!", 0)
				redirect_to product_path(product) 
			end
		else
			message("Ups!! The email is invalid!!", 0)
			redirect_to product_path(product) 
		end
	end


	private

	def getMaxBidForProduct(product)
		0 || product.bids.order(amount: :desc).limit(1)[0].amount
	end
end
