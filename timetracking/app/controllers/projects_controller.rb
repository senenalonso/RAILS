class ProjectsController < ApplicationController
	def index
		@projects = Project.order(created_at: :desc)
											 .limit(10)
	end
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
			description: params[:project][:description],
			logo: params[:project][:logo]
			)
		@project.save

		redirect_to "/projects/#{@project.id}"
	end

	private

	def project_params
		params.require(:entry).permit(:name, :description, :logo)
	end
end
