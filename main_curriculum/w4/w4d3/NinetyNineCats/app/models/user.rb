# require 'byebug'

class User < ActiveRecord::Base
  validates :user_name, :password_digest, :session_token, presence: true
  validates :user_name, :session_token, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true }

  after_initialize :ensure_session_token

  has_many :cats

  has_many :cat_rental_requests

  has_many :rented_cats,
    through: :cat_rental_requests,
    source: :cat

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  attr_reader :password

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token
    self.session_token = generate_session_token
    self.save!

    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
