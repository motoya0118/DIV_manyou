class Task < ApplicationRecord
  validates :title,  presence: true
  validates :content,  presence: true
  validates :deadline,  presence: true
  validates :status, inclusion: {in: ['未着手','着手中','完了']},presence: true

  enum status: {未着手:0,着手中:1,完了:2}
  scope :created_at, -> {order(created_at: "DESC")}
  scope :deadline, -> {order(deadline: "DESC")}
  scope :status, -> (status){where(status: status)}
  scope :title, -> (title){where("title LIKE ?","%#{title}%")}
  scope :title_status, -> (title,status){where("title LIKE ?","%#{title}%").where(status: status)}
end
