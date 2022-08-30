class Public::PostsController < ApplicationController
    
    def new
     @post=Post.new    
    end    
    
    def create
     @post=Post.new(post_params)
     @post.post_status = 1
     @post.user_id=current_user.id
     @post.save
     redirect_to public_posts_path
    end
    
    def show
     @post=Post.find(params[:id])
    end
    
    def index
     @posts=Post.all
    end
    
    def destroy
    end
    
    def post_params
     params.required(:post).permit(:caption, :image)
    end 
    
end
