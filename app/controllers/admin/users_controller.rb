class Admin::UsersController < ApplicationController
  
  def index
    @users = User.all  
  end
  
  def show
    @user = User.find(params[:id]) 
    @post = @user.posts
  end
  
  def edit
    @user = User.find(params[:id])  
  end
  
  def update
    @user = User.find(params[:id])  
    @user.update(user_params)
    
  end
  
  private
   def user_params
     params.require(:user).permit(:profile_image,
                                  :user_name,
                                  :introduction,
                                  :is_active)
   end
  
  
end
