class ChannelsController < ApplicationController
  
  def index
  @channels = Channel.all
  end
  
  def new
    @channel = Channel.new
    render :new
  end
  
  def show

    @channel = Channel.find(params[:id])
    @comments = @channel.comments
    puts '-----------------------------------------------------'
    @comments.each do |comment|
      puts comment.content
      puts comment.channel_id
    end
    puts '-----------------------------------------------------'

    render :show
  end
  
  def create
    @channel = Channel.new(channel_params)

    if @channel.save
      redirect_to index_channel_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
    # ここから追加
  def edit
    @channel = Channel.find(params[:id])
    render :edit
  end

  def update
    @channel = Channel.find(params[:id])
    if params[:channel][:image]
      @channel.image.attach(params[:channel][:image])
    end
    if @channel.update(channel_params)
      redirect_to index_channel_path, notice: '更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # ここまで
  
   # ここから追加
  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    redirect_to index_channel_path, notice: '削除しました'
  end
  # ここまで

  private

  def channel_params
    params.require(:channel).permit(:title, :body)
  end
  

  def comment_params
    params.require(:comment).permit(:content, :id).merge(channel_id: params[:channel_id])
  end
end

