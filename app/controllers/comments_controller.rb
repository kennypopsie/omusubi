class CommentsController < ApplicationController
    before_action :authenticate_user!
    
  # def edit
  #   @comment = Comment.find(params[:id])
  #   render :new
  # end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    # @comment = Comment.find(params[:post_id])
    @comments = Comment.where(post_id: params[:post_id])
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id] # post_idを設定

    if @comment.save
      redirect_to new_comment_path(params[:post_id]), notice: 'コメントしました'
    else
      # 失敗した場合には app/views/posts/show.html.erb で必要な変数を取得します
      @post = Post.find(params[:post_id])
      @comments = Comment.where(post_id: params[:post_id])
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to new_comment_path, notice: '更新しました'
    else
      render :edit, status: :unprocessable_entity
    end 
  end 
  
     # ここから追加
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to new_comment_path, notice: '削除しました'
  end
  # ここまで

  private
  def comment_params
    params.require(:comment).permit(:content, :id).merge(post_id: params[:post_id])
  end
end

