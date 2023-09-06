class ChannelsController < ApplicationController
  
  def index
  @channels = Channel.all
  end
  
  def new
    @channel = Channel.new
    render :new
  end
  
  def show
    # このidはurl(ルーティングに記述されている)から引っ張ってくる
    @channel = Channel.find(params[:id])
    @comments = @channel.comments
    render :show
  end
  
  def create
    @channel = Channel.new(channel_params)
    # @comment.user_id = current_user.id

    if @channel.save
      redirect_to index_channel_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
    # ここから追加
  def edit
    # @channels = Channel.all
    @channel = Channel.find(params[:id])
    render :edit
  end

  def update
    @channel = Channel.find(params[:id])
    
    if @channel.update(channel_params)
      redirect_to index_channel_path, notice: '更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    redirect_to index_channel_path, notice: '削除しました'
  end

  private

  def channel_params
    # channelモデルのtitleを取得
    params.require(:channel).permit(:title)
  end
  

  # def comment_params
  #   params.require(:comment).permit(:content, :id).merge(channel_id: params[:channel_id])
  # end
end

