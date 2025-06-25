class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts, dependent: :destroy
end
