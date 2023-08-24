class UsersController < ApplicationController

# def user_params
#   params.require(:user).permit(:name, :image, :image_cache) # 変更後
# end

  def show
    @user = current_user
  end
  
  #省略
def update
  if @user.update(user_params)
    redirect_to root_path
  else
    render :edit
  end
end
#省略
private
def user_params
  params.require(:user).permit(:name, :email, :image)
end
  
end