class AddColumnDeadline < ActiveRecord::Migration[5.2]
  def change
     add_column :tasks, :deadline, :date, default: '2000-01-01'
     change_column_null :tasks ,:deadline ,false
  end
end
