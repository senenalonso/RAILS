class ContactsController < ApplicationController	
	def index
		@contacts = Contact.order(created_at: :asc)
											 .limit(10)
	end
	def show
		@contact = Contact.find_by(id: params[:id])
		unless @contact.present?
			render file: 'public/404.html', status: :not_found
		end
	end
	def new
		@contact = Contact.new
	end
	def create
		@contact = Contact.new(
			name: params[:contact][:name],
			address: params[:contact][:address],
			phonenumber: params[:contact][:phonenumber],
			email: params[:contact][:email],
			favorite: params[:contact][:favorite]
			)
		if @contact.save
			redirect_to "/contact/#{@contact.id}"
		else
			render "new"
		end
	end
	def favorite
		contact = Contact.find_by(id: params[:contactId])
		if params[:favorite_action] == "add"
			contact.update(favorite: 1)
		else
			contact.update(favorite: 0)
		end

		redirect_to "/contacts"
	end
end
