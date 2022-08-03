class AddUserReferanceLabelmaster < ActiveRecord::Migration[5.2]
  def change
    add_reference :label_masters, :user, foreign_key: true
  end
end
