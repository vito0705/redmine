class Task < ActiveRecord::Base
  def self.find_or_create_record(user_id, status_id)
    record = Task.where("user_id = ? AND status_id = ?", user_id, status_id).first
    record_changed =0
    if record.nil? || record.blank?
      task = Task.new
      task.user_id = user_id
      task.status_id = status_id
      task.task_num = 0
      task.money_num = 0
      task.save
      record = Task.where("user_id = ? AND status_id = ?", user_id, status_id).first
      return record
    else
      if record.task_num.nil?
        record.task_num = 0
        record_changed = 1
      end
      if record.money_num.nil?
        record.money_num = 0
        record_changed = 1
      end
      if record_changed ==1
        record.save
        record = Task.where("user_id = ? AND status_id = ?", user_id, status_id).first
        # record_changed = 0
      end

      return record
    end
  end
end
