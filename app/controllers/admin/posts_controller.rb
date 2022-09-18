class Admin::PostsController < ApplicationController
    
    def index
     @posts = Post.all    
    end
    
    def show
     @post = Post.find(params[:id])
     @user = @post.user
    end
    
    def destroy
     @post = Post.find(params[:id])
     @post.destroy
     flash[:alert] = '投稿を削除しました'
     redirect_to admin_posts_path
    end
end
