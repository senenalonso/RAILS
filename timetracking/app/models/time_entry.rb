class TimeEntry < ApplicationRecord
	belongs_to	:project

	validates :hours, :minutes, :comments, presence: true

	def self.last_month
		where('date > ?', Date.today - 1.month)		
	end
end
