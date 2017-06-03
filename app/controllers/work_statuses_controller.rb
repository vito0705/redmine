class WorkStatusesController < ApplicationController
  def index
    @persons = User.where("status = 1").all
    # p @persons
    p params
    user_id_params = params[:user][:id] if params[:user]
    # p user_id_params
    if user_id_params.nil?
      @work_info = nil
    else
      @user = User.find(user_id_params)
      @work_info = WorkStatus.status_info user_id_params
      p @work_info
    end

  end
end
