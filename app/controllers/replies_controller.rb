class RepliesController < ApplicationController

def new
      @reply = Reply.new
end
  def show
    @reply = Reply.new
    @comment = Channel.find(2)
    @comments = Comment.all
    @replies = Reply.all
    render :show
  end
  
  
  def create
    # インスタンスの作成とパラメーターの取得を許可
    # reply変数にcomment_idを紐付け。replyいる？    

    @reply = Reply.new(reply_params)
    @reply.comment_id = params[:reply][:comment_id] 
    @reply.user_id = current_user.id
    if @reply.save
      redirect_to channel_path(params[:id]), notice: 'コメントしました'
    else
      # 失敗した場合には app/views/posts/show.html.erb で必要な変数を取得します
      @channel = Channel.find(params[:id])
      @comments = Comment.where(channel_id: params[:id])
      render :show, status: :unprocessable_entity
    end
  end
  
  # def update
  #   @comment = Comment.find(params[:id])

  #   if @comment.update(comment_params)
  #     redirect_to request.referer, notice: '更新しました'
  #   else
  #     render "channels/show", status: :unprocessable_entity
  #   end 
  # end 
  
  #   # ここから追加
  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  #   redirect_to request.referer, notice: '削除しました'
  # end
  # ここまで

  private
  def reply_params
    params.require(:reply) .permit(:content, :comment_id)
  end
end
