class CreateLabelChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :label_children do |t|
      t.references :task, foreign_key: true
      t.references :label_master, foreign_key: true

      t.timestamps
    end
  end
end
