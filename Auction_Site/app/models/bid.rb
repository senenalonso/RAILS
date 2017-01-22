class Bid < ApplicationRecord
	belongs_to :product

	validate :valid_bid, on: :create

	def valid_bid
    if amount < Product.find(product).minimun_bid
    	errors.add(:bid, "The bid must be equal or greater than minimun bid")
    end
  end
end
