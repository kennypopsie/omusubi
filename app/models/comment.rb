class Comment < ApplicationRecord
    # Validation
  validates :content, presence: true, length: { maximum: 1000 }

  belongs_to :channel
end
