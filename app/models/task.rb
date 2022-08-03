class Task < ApplicationRecord
  validates :title,  presence: true
  validates :content,  presence: true
  validates :deadline,  presence: true
  validates :status, inclusion: {in: ['未着手','着手中','完了']},presence: true
  validates :priority, presence: true
  belongs_to :user
  has_many :label_childs, dependent: :destroy
  has_many :labels, through: :label_childs, source: :label_master
  has_many :reads ,dependent: :destroy
  accepts_nested_attributes_for :label_childs,allow_destroy: true,reject_if: lambda {|attributes| attributes['name'].blank?}
  mount_uploader :image, ImageUploader
  enum status: {未着手:0,着手中:1,完了:2}
  enum priority: {低:0,中:1,高:2}
  scope :created_at, -> {order(created_at: "DESC")}
  scope :deadline, -> {order(deadline: "DESC")}
  scope :status, -> (status){where(status: status)}
  scope :title, -> (title){where("title LIKE ?","%#{title}%")}
  scope :title_status, -> (title,status){where("title LIKE ?","%#{title}%").where(status: status)}
  scope :priority, -> {order(priority: "DESC")}
  #scope :label_ids, -> (label_id){joins(:labels).where(labels: { id: label_id })}

  # def start_time
  #   self.my_related_model.deadline ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  # end

end
