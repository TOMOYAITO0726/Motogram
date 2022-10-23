class Admin::PostsController < ApplicationController
    
    def index
     @posts = Post.all.order(created_at: :desc)
    end
    
    def show
     @post = Post.find(params[:id])
     @user = @post.user
    end
    
    def destroy
     post = Post.find(params[:id])
     post.destroy
     flash[:notice] = '投稿を削除しました'
     redirect_to admin_posts_path
    end
end
