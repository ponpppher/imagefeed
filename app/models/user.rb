class User < ApplicationRecord
  # バリテーション前に小文字化させる
  before_validation { email.downcase! }

  # passwordのハッシュ値をpassword_digestカラムで保持
  # autenticateメソッドを使用できるようになる
  has_secure_password

  # 空値禁止、30文字まで
  validates :name, presence:true, length: {maximum: 30 }
  # 空値禁止、255文字まで
  # emailのフォーマット指定,重複禁止
  validates :email, presence:true, length: {maximum: 255},
    format:{with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
    uniqueness: true

  has_many :feeds
  has_many :favorites, dependent: :destroy
  has_many :favorite_feed, through: :favorites, source: :feed
end
