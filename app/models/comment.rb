class Comment < ApplicationRecord
    
    belongs_to :user
    belongs_to :post 
    has_many :notifications, dependent: :destroy
   
    
    def written_by?(current_user)
      self.user == current_user
    end
    
    
    
end
