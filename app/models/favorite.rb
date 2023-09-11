class Favorite < ApplicationRecord
  
  belongs_to :user
  # belongs_to :reply
  belongs_to :comment

# ユーザーidとコメントidは一対一
  validates_uniqueness_of :comment_id, scope: :user_id
end
