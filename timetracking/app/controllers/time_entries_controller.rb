class TimeEntriesController < ApplicationController

	def index
		@entries = project.time_entries.last_month
	end

	def new
		@entry = project.time_entries.new
	end

	def create
		@entry = project.time_entries.new(
								hours: params[:time_entry][:hours],
								minutes: params[:time_entry][:minutes],
								date: params[:time_entry][:date],
								comments: params[:time_entry][:comments]
							)
		if @entry.save
			message("Time entry created successfully", 0) 
			redirect_to "/projects/#{project.id}/time_entries"
		else 
			message("Ups!! Try again!!", 0) 
			render 'new'
		end
	end

	def edit
		time_entry
	end
	
	def update
		if time_entry.update(time_entry_params)			
			message("Time entry updated successfully", 0) 
			redirect_to "/projects/#{project.id}/time_entries"
		else 
			message("Ups!! Try again!!", 0) 
			render 'edit'
		end
	end

	def delete
		time_entry.delete
		redirect_to "/projects/#{project.id}/time_entries"		
	end



	private

	def project
		@project = Project.find(params[:project_id])
	end

	def time_entry
		@entry = project.time_entries.find(params[:time_entry_id])
	end

	def time_entry_params
		params.require(:time_entry).permit(:hours, :minutes, :date, :comments)
	end

	def message(text, option)
		if option==1
			alert(text)
		else
			notice(text)
		end
	end

	def notice(text)
		flash[:notice] = text 
	end

	def alert(text)
		flash[:alert] = text
	end
end
