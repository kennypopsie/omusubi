class CommentsController < ApplicationController
    before_action :authenticate_user!
    
  # def edit
  #   @comment = Comment.find(params[:id])
  #   render :new
  # end

  # def new
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.new
  #   # @comment = Comment.find(params[:post_id])
  #   @comments = Comment.where(post_id: params[:post_id])
  #   render :new
  # end

  def create
    @comment = Comment.new(comment_params)
    @comment.channel_id = params[:id] # post_idを設定
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to channel_path(params[:id]), notice: 'コメントしました'
    else
      # 失敗した場合には app/views/posts/show.html.erb で必要な変数を取得します
      @channel = Channel.find(params[:id])
      @comments = Comment.where(channel_id: params[:id])
      render "channels/show", status: :unprocessable_entity
    end
  end
  
  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to request.referer, notice: '更新しました'
    else
      render "channels/show", status: :unprocessable_entity
    end 
  end 
  
     # ここから追加
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer, notice: '削除しました'
  end
  # ここまで

  private
  def comment_params
    params.permit(:content)
  end
  # def comment_params

  #   params.permit(:content, :id).merge(channel_id: params[:channel_id])
  # end
end

