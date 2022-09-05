class Public::RelationshipsController < ApplicationController
    
    def create
      @user = User.find(params[:user_id])  
      follow = current_user.active_relationships.new(followed_id: params[:user_id])
      follow.save
      @user.create_notification_follow(current_user)
      redirect_to public_user_path(params[:user_id])
    end     

    def destroy
       follow = current_user.active_relationships.find_by(followed_id: params[:user_id])
       follow.destroy
       redirect_to public_user_path(params[:user_id])
    end
        
end
