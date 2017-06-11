class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :status_id
      t.integer :task_num

      t.timestamps null: false
    end
  end
end
