class TimeEntry < ApplicationRecord
	belongs_to	:project

	def self.last_month
		where('date > ?', Date.today - 1.month)		
	end
end
