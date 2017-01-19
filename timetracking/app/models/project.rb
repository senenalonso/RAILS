class Project < ApplicationRecord
	has_many	:time_entries	

	def self.clean_old
		projects = where('created_at < ?', Date.today - 1.week)
		projects.delete_all
	end
end
