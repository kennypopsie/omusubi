class StudiesController < ApplicationController
    before_action :authenticate_user!
    
  def new
    @study = Study.new
  end
  
  def index
    @studies = Study.all
    @study = Study.find(params[:id])
  end

  def create
    @study = Study.new
    @study.user_id = current_user.id
    @study.start_time = Time.now
    if @study.save
      # idをリダイレクト先に渡す
      redirect_to studies_path(id: @study.id), notice: 'Current time recorded.'
    else
      redirect_to studies_path, alert: 'Failed to record current time.'
    end
  end
  
  def update
    @study = Study.find(params[:id])
    # @comment = Comment.find(params[:id])
    if @study.update(end_time: Time.now)    
      redirect_to request.referer, notice: '更新しました'
    else
      redirect_to request.referer, status: :unprocessable_entity
    end 
  end
  
  # private
  # def study_params
  #   params.permit(:id)
  # end
  
end
