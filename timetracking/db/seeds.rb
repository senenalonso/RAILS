5.times do |index|
		project = Project.create!(name: "Project #{index}",
															description: "Description #{index}",
															created_at: Date.today - (2*index).day
															)
		2.times do |index2|
			project.time_entries.create(hours: index2,
																 minutes: index*index2,
																 date: Date.today - (2*index2).day,
																 comments: "Comment #{index2}")

			project.time_entries.create(hours: 10,
																 minutes: 20,
																 date: Date.new(2001,2,3),	
																 comments: "Past comment")
		end
end