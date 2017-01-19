class Contact < ApplicationRecord
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	validates :name, :address, presence: {message: "Name and address are mandatory"}
	validates :phonenumber, format: { with: /\d{3} \d{2} \d{2} \d{2}/, message: "Phone number not valid (XXX XX XX XX)" }
	validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Email not valid" }
end
