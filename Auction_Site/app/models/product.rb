class Product < ApplicationRecord
	belongs_to :user
	has_many :bids

	validate :valid_bid, on: :create

	def valid_bid

	binding.pry

    if bid < minimun_bid
      errors.add(:bid, "must be equal or greater than minimun bid")
    end
  end
end
