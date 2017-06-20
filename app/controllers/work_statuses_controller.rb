class WorkStatusesController < ApplicationController
  before_action :find_optional_user
  before_action do 
    if !User.current.admin?
      @admin_judge = nil
    else
      @admin_judge = 1
    end
  end
    

  def index
    user_id_params = params[:user][:id] if params[:user]
    if user_id_params.nil?
      @work_info = nil
    else
      @user = User.find(user_id_params)
      @work_info = WorkStatus.status_info_json user_id_params
      # p @work_info
    end
  end

  def edit
    #进入编辑总量页面
    @tasks = params[:data]
    @user = User.find(@tasks[:record]["user_id"].to_i)
  end

  def update

    task_num = params[:task_num].to_i

    user_id = params[:user_id]
    status_id = params[:status_id]
    if task_num
      task = Task.where("user_id = ? AND status_id = ?", user_id, status_id).first
      task.task_num = task_num
      task.save
      redirect_to :action => 'index', :user => {:id => user_id}
    else
      redirect_to request.url, flash: "请在文本框中正确输入数量大小"
    end

  end

  private
  def find_optional_user
    @persons = User.where("status = 1").all
  end
end
