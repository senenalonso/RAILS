class SiteController < ApplicationController
	def home
		render 'home' #name of view template
	end
	def contact
		render 'contact', layout: 'application2' #name of view template
	end
	def calculator
		render 'calculator', layout: 'application' #name of view template
	end
	def calculate
		@num1 = params[:first_num].to_f
		@num2 = params[:second_num].to_f
		@result = @num1 + @num2
		render 'calculate'		
	end
end
