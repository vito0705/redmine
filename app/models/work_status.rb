class WorkStatus < ActiveRecord::Base
  def self.status_info_json user_id
    customized = IssueCustomField.where("name = ?","项目金额").first
    work_info = Issue.where("assigned_to_id = ?" , user_id).order(:status_id).all
    render_user_hash = Hash.new

    status = IssueStatus.all
    status.each do |sta|
      work_num = 0
      money_num = 0.0
      render_status_hash = Hash.new

      record = Task.find_or_create_record(user_id, sta[:id])
      record_hash = record.attributes.dup
      #计算各个状态下的工作总量和任务金额总量
      work_info.each do |work|
        if work[:status_id] == sta[:id]
          work_num = work_num + 1
          money_task_str = work.custom_field_value customized[:id]
          money_task = money_task_str.to_f
          if money_task.nil? || money_task.blank?
            money_task = 0.0
          end
          money_num = money_num + money_task
        end
      end
      render_status_hash[:status] = sta.attributes.dup
      render_status_hash[:num] = work_num
      render_status_hash[:money] = money_num
      render_status_hash[:record] = record_hash

      render_user_hash["#{sta["name"]}"] = render_status_hash
    end
    return render_user_hash
  end
end