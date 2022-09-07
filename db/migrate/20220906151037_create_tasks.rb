class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status, :default => :new
      t.timestamp :ends_at
      t.timestamp :deadline_at
      t.timestamp :canceled_at
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
