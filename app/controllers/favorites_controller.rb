class FavoritesController < ApplicationController
  
  def create
   @favoreite = current_user.favorites.create(comment_id: params[:comment_id])
  # @comment = Comment.find(params[:comment_id])  # コメントを取得
  # @comment_favorite = Favorite.new(user_id: current_user.id, comment_id: params[:comment_id])
    # favorite = current_user.favorites.new(book_id: book.id)

  # @comment_favorite.save
   redirect_to request.referer
   
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @favorite = current_user.favorites.find_by(comment_id: @comment.id)
    @favorite.destroy
    
    
  # @comment = Comment.find(params[:comment_id])  # コメントを取得
  # @comment_favorite = Favorite.find_by(user_id: current_user.id, comment_id: params[:comment_id])
  # @comment_favorite.destroy
   redirect_to request.referer
  end


end
