class User < ApplicationRecord
  before_update :cant_permission_zero

  validates :email,presence: true, uniqueness: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password_digest,presence: true
  before_validation { email.downcase! }
  has_many :tasks,dependent: :destroy
  has_many :label_masters, dependent: :destroy
  has_many :table_groupusers,dependent: :destroy
  has_many :groups_through, through: :table_groupusers, source: :group
  has_many :reads,dependent: :destroy
  mount_uploader :icon, IconUploader

  has_secure_password

  private
  def cant_permission_zero
    users = User.all
    ct = 0
    users.each do |user|
      ct += 1 if user.permission
    end

    if ct == 1 && permission == false && email.nil?
      throw :abort
    end
  end

end
