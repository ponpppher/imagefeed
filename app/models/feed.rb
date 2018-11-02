class Feed < ApplicationRecord
  validates:content, presence:true
  validates:content, length:{minimum:1}
  validates:content, length:{maximum:255}

  mount_uploader :image, ImageUploader

  belongs_to :user
end
