class Public::CommentsController < ApplicationController
    
    def create
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.new(comment_params)
      @comment.post_id = @post.id
      if @comment.save
        @post.create_notification_comment(current_user,@comment.id)
        redirect_to public_post_path(@post)
      else
        render   public_post_path(@post)
      end
    end   
      
    def destroy
     @post = Post.find(params[:post_id])
     @comment = Comment.find(params[:id])
     @comment.destroy
     flash[:notice] = "コメントを削除しました"
     redirect_to  public_post_path(@post)
    end
    
    
    private
      
    def comment_params
      params.required(:comment).permit(:content)  
    end 

end
