class CreateTableGroupuser < ActiveRecord::Migration[5.2]
  def change
    create_table :table_groupusers do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
    end
  end
end
