class User < ApplicationRecord
	has_many :products

	before_save { self.email = email.downcase }

	validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

	has_secure_password

	def self.getIdByEmail(email)
		user = where('email == ?', email)[0]
		(user.present?)? user.id : nil
	end

	def self.getNameById(id)
		find(id).name
	end

	def self.checkUser?(email,password)
		user = where('email == ?', email)[0]
		if user && user.authenticate(password)
			user.id
		end
	end
end
