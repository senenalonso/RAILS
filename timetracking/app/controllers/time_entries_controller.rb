class TimeEntriesController < ApplicationController
	def index
		@project = Project.find(params[:project_id])
		@entries = @project.time_entries.select{|e| e.date.mon == Date.today.mon}	
	end
end
