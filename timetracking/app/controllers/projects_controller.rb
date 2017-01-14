class ProjectsController < ApplicationController
	def index
		@projects = Project.order(created_at: :desc)
											 .limit(10)
	end
<<<<<<< HEAD
	def show
		@project = Project.find_by(id: params[:id])
		if @project.present?
			render layout: 'show'
		else
			render file: 'public/404.html', status: :not_found
		end
	end
	def new
		@project = Project.new
	end
	def create
		@project = Project.new(
			name: params[:project][:name],
			description: params[:project][:description]
			)
		@project.save

		redirect_to "/project/#{@project.id}"
	end
=======
>>>>>>> a7ae43eb209a92e74d12611c0b605dd24660452f
end
