class Reply < ApplicationRecord
  
  validates :content, presence: true, length: { maximum: 1000 }

  belongs_to :user, optional: true
  belongs_to :comment
  
  
end
