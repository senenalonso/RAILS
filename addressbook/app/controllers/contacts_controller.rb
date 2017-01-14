class ContactsController < ApplicationController	
	def index
		@contacts = Contact.order(created_at: :desc)
											 .limit(10)
	end
end
