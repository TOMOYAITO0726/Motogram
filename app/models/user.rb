class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy 
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :followers, through: :passive_relationships, source: :following
  
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
   
  enum displacement: { 
    under_50: 0,
    over_51_under_125: 1, 
    over_126_under_250: 2, 
    over_251_under_400: 3, 
    over_401_under_750: 4,
    over_751_under_1000: 5, 
    over_1001: 6, 
    other: 7
  }
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com', 
                       last_name: "guest", 
                       first_name:"tarou", 
                       last_name_kana:"ゲスト", 
                       first_name_kana:"タロウ", 
                       telephone_number:"000000000", 
                       user_name:"ゲスト",
                       introduction:"はじめしてゲストです",
                       model:"Ninja250",
                       displacement:"over_126_under_250") do |user|
      user.password = SecureRandom.urlsafe_base64
      
    end
  end
  
  def create_notification_follow(current_user)
    temp = Notification.where(["visitor_id=? and visited_id=? and action=?",current_user.id,id,'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
        )
      notification.save if notification.valid?  
    end   
  end
  
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end   
  
  has_one_attached :profile_image
  
  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def self.looks(word) # User.looks("word")
     User.where("user_name LIKE?","%#{word}%")
  end
  
  def total_distance # @user.total_distance, User.find(1).total_distance
    posts.sum(:distance)
  end
end
