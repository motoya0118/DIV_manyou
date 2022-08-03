class LabelMaster < ApplicationRecord
  has_many :label_childs
  belongs_to :user
end
