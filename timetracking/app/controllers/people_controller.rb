class PeopleController < ApplicationController
	def index
		@people = Person.order(created_at: :desc)
											 .limit(10)
	end
	def show
		@person = Person.find_by(id: params[:id])
		if @person.present?
			render 'show'
		else
			render file: 'public/404.html', status: :not_found
		end
	end
	def new
		@person = Person.new
		@projects = Project.all
	end
	def create
		@person = Person.new(
			name: params[:person][:name],
			email: params[:person][:email],			
			)

		if @person.save
			params[:projects].each do |p|
				@person.projects << Project.find(p)
			end
		end

		redirect_to person_path @person
	end

	def edit
		@person = Person.find(params[:id])
	end
	
	def update
		if person.update(person_params)	
			params[:projects].each do |p|
				@person.projects << Project.find(p)
			end		
			message("Person updated successfully", 0) 
			redirect_to people_path person
		else 
			message("Ups!! Try again!!", 0) 
			render 'edit'
		end
	end

	private

	def person_params
		params.require(:entry).permit(:name, :description, :projects[])
	end

end
