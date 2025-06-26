class User < ApplicationRecord
  has_secure_password
  attr_accessor :remember_token
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts, dependent: :destroy

  def remember
    # Generates a random token/secret for the new remember_token field of the model which is updated
    # in an encrypted form as the parameter :remember_digest
    self.remember_token = SecureRandom.urlsafe_base64
    update_attribute(:remember_digest, Digest::SHA256.hexdigest(remember_token))
  end

  def authenticated?(token)
    return false if remember_digest.nil?
    # Decrypt the token argument and compare if it is the same as the remember_digest
    Digest::SHA256.hexdigest(token) == remember_digest
  end

  def forget
    # Nullify the remember_digest field
    update_attribute(:remember_digest, nil)
  end
end
