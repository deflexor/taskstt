class CreateApprovements < ActiveRecord::Migration[7.0]
  def change
    create_table :approvements do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :task_id, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :task_id], unique: true
    end
  end
end
