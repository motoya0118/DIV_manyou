class Task < ApplicationRecord
  validates :title,  presence: true
  validates :content,  presence: true
  #scope :created_at, -> {order(created_at: "DESC").all}
  #scope :deadline, -> {order(deadline: "DESC").all}
end
