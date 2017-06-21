class AddMoneyNumToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :money_num, :float
  end
end
