class Feed < ApplicationRecord
  validates:content, presence:true
  validates:content, length:{minimum:1}
  validates:content, length:{maximum:255}

  mount_uploader :image, ImageUploader

  validates:image, presence:true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_user, through: :favorites, source: :user
end
