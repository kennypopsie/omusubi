class StudiesController < ApplicationController
    before_action :authenticate_user!
    
  def new
  end
  
  def index
  end

  def create
    @study = Study.new
    @study.user_id = current_user.id
    @study.start_time = Time.now

    if @study.save
      # 保存が成功した場合の処理
      redirect_to studies_path, notice: 'Current time recorded.'
    else
      # 保存が失敗した場合の処理
      redirect_to studies_path, alert: 'Failed to record current time.'
    end
  end
  
  def update
  end
  
end
