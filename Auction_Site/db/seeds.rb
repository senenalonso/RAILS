5.times do |index|
		user = User.create(name: "User #{index}",
											 email: "user#{index}@auctionsite.com",
											)
		2.times do |index2|
			user.products.create(title: "Product#{index2}",
													 description: "Description#{index2}",
													 deadline: Date.today + (2*index2).hour,
													 minimun_bid: 10*index	
													 )
		end
end

User.update(password: "password")
