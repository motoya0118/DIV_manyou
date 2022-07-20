class User < ApplicationRecord
  validates :email,presence: true, uniqueness: true
  validates :password_digest,presence: true
  validates :permission,presence: true
  has_many :tasks,dependent: :destroy

  has_secure_password
end
