class Comment < ApplicationRecord
    # Validation
  validates :content, presence: true, length: { maximum: 1000 }

  belongs_to :channel, optional: true
  belongs_to :user
  has_many :replies, dependent: :destroy
end
