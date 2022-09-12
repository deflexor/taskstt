class CreateApprovements < ActiveRecord::Migration[7.0]
  def change
    create_table :approvements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :task_id], unique: true
    end
  end
end
