class Notification < ApplicationRecord
  belongs_to :visitor
  belongs_to :visited
  belongs_to :post
  belongs_to :comment
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional:true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional:true
end
