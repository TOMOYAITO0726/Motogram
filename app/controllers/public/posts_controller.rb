class Public::PostsController < ApplicationController
    
    def new
     @post=Post.new    
    end    
    
    def create
     @post = Post.new(post_params)
     #@#post.post_status = 1
     @post.user_id=current_user.id
     if @post.save
       flash[:alert] = '新規投稿を行いました'
       redirect_to public_posts_path
     else
       redirect_to new_public_post_path
     end 
    end
    
    def show
     @post = Post.find(params[:id])
     @user = @post.user
     @comment = Comment.new
     if @post.post_status_private? && @post.user != current_user
        flash[:alert] = "このページにはアクセスできません。"
        redirect_to public_posts_path
     end 
    end
    
    def index
     @posts = Post.publics
     @user = current_user
    end
    
    def destroy
     @post = Post.find(params[:id])
     @post.destroy
     flash[:alert] = '投稿を削除しました'
     redirect_to  public_posts_path
    end
    
    def post_params
     params.required(:post).permit(
      :caption,  
      :post_status, 
      images: [])
    end 
    
end
