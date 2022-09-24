class Post < ApplicationRecord
    
    has_many_attached :images
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :notifications, dependent: :destroy
    validates :caption, presence: true
    validates :images, presence: true
    scope :publics, -> { where(post_status: 0) }
    geocoded_by :address
    after_validation :geocode
    
    enum post_status: { public: 0, private: 1}, _prefix: true
    
    def create_notification_like(current_user)
      temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
      if temp.blank?
        notification = current_user.active_notifications.new(
          post_id: id,
          visited_id: user_id,
          action: 'like'
          )
        if notification.visitor_id == notification.visited_id
           notification.checked = true
        end
          notification.save if notification.valid?
      end
    end 
    
    def create_notification_comment(current_user,comment_id)
      temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
      temp_ids.each do |temp_id|
        save_notification_comment(current_user, comment_id, temp_id['user_id'])
      end
      save_notification_comment(current_user, comment_id, user_id) if temp_ids.blank?
    end  
    
    def save_notification_comment(current_user, comment_id, visited_id)
      
      notification = current_user.active_notifications.new(
        post_id: id,
        comment_id: comment_id,
        visited_id: visited_id,
        action: 'comment'
        )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end   
      notification.save if notification.valid?
    end
    
    def get_image(width,height)
      unless images.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpg')
        images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
        images.first.variant(resize_to_limit: [width, height]).processed
    end
    
    def favorited_by?(user)
      favorites.exists?(user_id: user.id)
    end
  
    def self.looks(word)
      Post.where("caption LIKE?","%#{word}%")
    end   
      
       
end
