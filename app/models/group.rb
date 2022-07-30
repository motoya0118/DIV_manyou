class Group < ApplicationRecord
  has_many :groupusers
  has_many :groups_through, through: :groupusers, source: :user
  validates :name , presence: true
end
