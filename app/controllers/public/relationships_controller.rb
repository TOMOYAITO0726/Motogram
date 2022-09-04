class Public::RelationshipsController < ApplicationController
    
    def create
      follow = current_user.active_relationships.new(followed_id: params[:user_id])
      follow.save
      redirect_to public_user_path(params[:user_id])
    end     

    def destroy
       follow = current_user.active_relationships.find_by(followed_id: params[:user_id])
       follow.destroy
       redirect_to public_user_path(params[:user_id])
    end
        
end
