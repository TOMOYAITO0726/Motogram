class Public::SearchesController < ApplicationController
   def  search
     @range = params[:range]
     if @range =="User"
       @users = User.looks(params[:word])
     elsif @range == "Post"
       @posts = Post.looks(params[:word])
     end
   end 
end 