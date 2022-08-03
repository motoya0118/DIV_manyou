class Group < ApplicationRecord
  has_many :table_groupusers, dependent: :destroy
  has_many :groups_through, through: :table_groupusers, source: :user
  validates :name , presence: true
end
