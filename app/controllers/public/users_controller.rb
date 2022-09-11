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
    
    def favorites
      @user = User.find(params[:id])
      favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
      @favorite_posts = Post.find(favorites)
    end
    
    private
    
    def user_params
      params.require(:user).permit(:profile_image,:user_name,:introduction)
    end
    
end
