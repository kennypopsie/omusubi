class PostsController < ApplicationController
  
  def index
  @posts = Post.all
  end
  
  def new
    @post = Post.new
    render :new
  end
  
    
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to index_post_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
    # ここから追加
  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if params[:post][:image]
      @post.image.attach(params[:post][:image])
    end
    if @post.update(post_params)
      redirect_to index_post_path, notice: '更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # ここまで
  
   # ここから追加
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to index_post_path, notice: '削除しました'
  end
  # ここまで

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
  
  
  # def create
  #   @post = Post.new(post_params)

  #   if @post.save
  #     redirect_to posts_path
  #   end
  # end

  # def post_params
  #   params.require(:post).permit(:body, :title)
  # end
  # def create
  #   @post = Post.new(post_params)

  #   if params[:post][:image]
  #     @post.image.attach(params[:post][:image])
  #   end

  #   if @post.save
  #     redirect_to new_channel_path, notice: '登録しました'
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end
  
  # private
  # def post_params
  #   params.require(:post).permit(:title, :body, :image)
  # end
  
end
