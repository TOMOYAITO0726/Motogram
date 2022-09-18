class Public::UsersController < ApplicationController
    
    def show
      @user = User.find(params[:id])
      @posts = @user.posts
    end 
    
    def edit
      @user = User.find(params[:id])
    end
    
    def profile
      @user = User.find(params[:id])
    end  
    
    def update
      @user = User.find(params[:id])
      p params[:user][:password]
      @user.update(user_params)
      redirect_to  public_user_path(current_user.id)
    end  
    
    def favorites
      @user = User.find(params[:id])
      favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
      @favorite_posts = Post.find(favorites)
    end
    
    def following_posts
      @user = User.find(params[:id])
      users = @user.followings
      @posts = Post.where(user_id: users.pluck(:id)) 
    end
    
    private
    
    def user_params
      params.require(:user).permit(:profile_image,
                                   :user_name,
                                   :introduction,
                                   :last_name,
                                   :first_name,
                                   :last_name_kana,
                                   :first_name_kana,
                                   :telephone_number,
                                   :email
                                   )
    end
    
end
