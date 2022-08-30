class Notification < ApplicationRecord
  belongs_to :visitor
  belongs_to :visited
  belongs_to :post
  belongs_to :comment
end
