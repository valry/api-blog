class User < ApplicationRecord
  validates    :nickname,              :password, :email, presence: true
  has_one      :avatar,                dependent: :destroy
  has_one      :api_key,               dependent: :destroy
  after_create :create_api_key,        :create_avatar
  has_many     :posts, foreign_key:    :author, dependent: :destroy
  has_many     :comments, foreign_key: :author, dependent: :destroy
end
