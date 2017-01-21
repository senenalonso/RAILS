class User < ApplicationRecord
	has_many :products

	validates :name, :email, presence: true
	validates :email, uniqueness: true

	def self.getIdByEmail(email)
		user = where('email == ?', email)[0]
		(user.present?)? user.id : nil
	end

	def self.getNameById(id)
		find(id).name
	end
end
