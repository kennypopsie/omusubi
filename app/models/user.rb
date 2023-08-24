class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  has_many :comments, dependent: :destroy

  has_one_attached :image

end
