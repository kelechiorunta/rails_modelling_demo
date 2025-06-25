class Post < ApplicationRecord
  validates :content, presence: true, uniqueness: true
  belongs_to :user
  has_many :comments, dependent: :destroy
end
