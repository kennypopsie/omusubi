class RepliesController < ApplicationController

def new
      @reply = Reply.new
end
  def show
    @reply = Reply.new
    @comment = Comment.find(params [:comment_id])
    @comments = Comment.all
    @replies = Reply.all
    @comment_2 = Comment.find(2)  # 2はコメントのIDです
    @replies_to_comment_2 = @comment_2.replies
    render :show
  end
  
  
    def create
    # インスタンスの作成とパラメーターの取得を許可
    # reply_paramsメソッドを使ってパラメータを取得します
  
    @reply = Reply.new(reply_params)
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
    params.permit(:content, :comment_id)
  end
end
