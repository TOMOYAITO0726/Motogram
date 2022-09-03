class Public::CommentsController < ApplicationController
    
    def create
      post = Post.find(params[:post_id])
      comment = current_user.comments.new(comment_params)
      comment.post_id = post.id
      comment.save
      redirect_to public_post_path(post)
    end   
      
    private
      
    def comment_params
      params.required(:comment).permit(:content)  
    end 

end
