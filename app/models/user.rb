class User < ApplicationRecord
  validates :email,presence: true, uniqueness: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password_digest,presence: true
  before_validation { email.downcase! }
  has_many :tasks,dependent: :destroy

  has_secure_password
end
