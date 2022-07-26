class LabelChild < ApplicationRecord
  belongs_to :label_master
  belongs_to :task

end
