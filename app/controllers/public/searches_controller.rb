class Public::SearchesController < ApplicationController
   def  search
     @range = params[:range]
     unless params[:word].present?
       @users = []
       @posts = []
       @range = []
       return
     end
     
     if @range =="User"
       @users = User.looks(params[:word])
     elsif @range == "Post"
       @posts = Post.looks(params[:word])
     end
   end 
end 