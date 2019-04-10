class User < ApplicationRecord
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  enum gender: [:male, :female, :other] 
  validates :password_digest, :fname, :lname, :gender, :dob, :presence: true
end
