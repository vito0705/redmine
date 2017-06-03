class WorkStatus < ActiveRecord::Base
  def self.status_info user_id
    work_info = Issue.where("assigned_to_id = ?" , user_id).order(:status_id).all
    p work_info.size

    render_arr = Array.new

    count_arr = 0
    status = IssueStatus.all
    status.each do |sta|
      work_num = 0
      status_arr = Array.new
      work_info.each do |work|
        if work[:status_id] == sta[:id]
          work_num = work_num + 1
        end
      end
      status_arr[0] = sta[:name]
      status_arr[1] = work_num
      render_arr[count_arr] = status_arr
      count_arr = count_arr + 1
    end
    return render_arr
  end
end