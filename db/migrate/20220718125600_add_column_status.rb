class AddColumnStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :integer, default: 0
    change_column_null :tasks ,:status ,false
  end
end
