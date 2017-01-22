class SiteController < ApplicationController	
	def home
		@user = User.new
		render 'home' #name of view template
	end
end
