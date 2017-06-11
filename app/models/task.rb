class Task < ActiveRecord::Base
  def self.find_or_create_record(user_id, status_id)
    record = Task.where("user_id = ? AND status_id = ?", user_id, status_id).first

    if record.nil? || record.blank?
      task = Task.new
      task.user_id = user_id
      task.status_id = status_id
      task.task_num = 0
      task.save
      record = Task.where("user_id = ? AND status_id = ?", user_id, status_id).first
      return record
    else
      if record.task_num.nil?
        record.task_num = 0
        record.save
        record = Task.where("user_id = ? AND status_id = ?", user_id, status_id).first
      end
      return record
    end
  end



end
