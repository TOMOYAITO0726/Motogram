class Public::UsersController < ApplicationController
    
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
      redirect_to  public_user_path(current_user.id)
    end  
    
    private
    
    def user_params
      params.require(:user).permit(:profile_image)
    end
    
end
