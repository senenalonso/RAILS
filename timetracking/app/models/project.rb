class Project < ApplicationRecord
	has_many	:time_entries	
	has_attached_file :logo, styles: {:medium=>"300x300>", :thumb =>"100x100>"}
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.+\z/

	def self.clean_old
		projects = where('created_at < ?', Date.today - 1.week)
		projects.delete_all
	end
end
